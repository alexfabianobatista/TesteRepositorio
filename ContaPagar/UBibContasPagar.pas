unit UBibContasPagar;

interface
  uses
    SysUtils, DateUtils;

  type TBibContasPagar = Class

  private

  public
    procedure ImprimeCompromissoRetifoz(pNumTitulo: integer; pDtEmissao: TDateTime); //INCLUÍDO POR CLEBER - 09/02/2021
    function GetDateInDateTime(Data : TDateTime): TDateTime;
  end;

  
var
  BibContasPagar: TBibContasPagar;

implementation

uses UContasPagar_cl, UContasPagarRel_cl, UBiblioteca, DB;



{ TBibContasPagar }


function  TBibContasPagar.GetDateInDateTime(Data : TDateTime) : TDateTime;
begin
  Result := EncodeDate(YearOf(Data), MonthOf(Data), DayOf(Data));
end;

procedure TBibContasPagar.ImprimeCompromissoRetifoz(pNumTitulo: integer; pDtEmissao: TDateTime);
var wCont: integer;
  wNumTitulo, testeData: string;
  wCol: Double;
begin
 //impressão para reparcelamento de CP Retifoz
  wNumTitulo := '';
  testeData := FormatDateTime('dd/MM/yyyy', GetDateInDateTime(pDtEmissao));
  if Imp = Nil Then
      Imp := TImp.Create;

  Imp.AbreImpressora;//----------abre impressora
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',32);//-----configurar pagina

  with DMContasPagarRel do
  begin

    QRTitulosReparceladosCP.Close;
    QRTitulosReparceladosCP.SetVariable('NUM_TITULO', pNumTitulo);
    QRTitulosReparceladosCP.SetVariable('DT_EMISSAO', testeData);
    QRTitulosReparceladosCP.Open;
    QRTitulosReparceladosCP.First;
    QRTituloOriginalRep.Close;
    while not QRTitulosReparceladosCP.Eof do
    begin
      wNumTitulo := wNumTitulo + QRTitulosReparceladosCPNUM_TITULO.Text;
      if QRTitulosReparceladosCP.RecordCount <> QRTitulosReparceladosCP.RecNo then
        wNumTitulo := wNumTitulo+ ', ';
      QRTitulosReparceladosCP.Next;
    end;

    QRTituloOriginalRep.SetVariable('NUM_TITULO', wNumTitulo);
    QRTituloOriginalRep.Open;

    sleep(100);

    QRTitulosReparceladosCP.First;

    while not QRTitulosReparceladosCP.eof do
    begin
      wCont:=1;


      Imp.WriteXY(28,wCont, 'C O M P R O M I S S O');
      inc(wCont,2);

      Imp.WriteXY(0, wCont, 'Codigo: ' + QRTitulosReparceladosCPCOD_CONTA_PAGAR_CAB.Text);
      Imp.WriteXY(4,wCont, 'TItulo: ' + QRTitulosReparceladosCPNUM_TITULO.Text);
      Imp.WriteXY(8,wCont, 'Parcela: ' + QRTitulosReparceladosCPNUM_PARCELA.Text);
      Imp.WriteXY(12, wCont, 'Vencimento: ' + QRTitulosReparceladosCPDT_VENCIMENTO.Text);
      inc(wCont, 2);

      Imp.WriteXY(0, wCont, 'Valor Total:' + FormatFloat('#,##0.00', SValTotal)); //soma o valor no DMContasPagarRel
      Imp.WriteXY(8, wCont, 'Val. Parcela: ' + FormatFloat('#,##0.00', QRTitulosReparceladosCPVAL_TITULO.Value));

      inc(wCont, 2);
      Imp.WriteXY(0, wCont, 'FORNECEDOR...:' + QRTitulosReparceladosCPTB_CADASTROCOD_CADASTRO.Text);
      inc(wCont);
      Imp.WriteXY(0, wCont, 'ENDERECO.....:' + QRTitulosReparceladosCPDESC_ENDERECO.Text);
      inc(wCont);
      Imp.WriteXY(0, wCont, 'MUNICIPIO....:' + QRTitulosReparceladosCPTB_CADASTRODESC_CIDADE.Text);
      inc(wCont);
      Imp.WriteXY(0, wCont, 'CNPJ/CPF.....:' + QRTitulosReparceladosCPNUM_CGC_CPF.Text);

      inc(wCont, 3);

      Imp.WriteXY(0, wCont, 'NUMERO');
      Imp.WriteXY(3, wCont, 'EMISSAO');
      Imp.WriteXY(6, wCont, 'VALOR');
      Imp.WriteXY(9, wCont, 'NUMERO');
      Imp.WriteXY(12, wCont, 'EMISSAO:');
      Imp.WriteXY(15, wCont, 'VALOR');

      inc(wCont);
      wCol := 0;

      QRTituloOriginalRep.First;
      while not QRTituloOriginalRep.Eof do
      begin

        if QRTituloOriginalRep.RecordCount mod 2 = 0 then
          wCol := 9
        else
          wCol := 0;

        Imp.WriteXY(wCol, wCont, QRTituloOriginalRepNUM_TITULO.Text);
        Imp.WriteXY(wCol+3, wCont, QRTituloOriginalRepDT_EMISSAO.Text);
        Imp.WriteXY(wCol+6, wCont, FormatFloat('#,##0.00', QRTituloOriginalRepSVALOR.Value));

        QRTituloOriginalRep.Next;
      end;

      QRTitulosReparceladosCP.Next;
      Imp.SaltaPagina;
    end;
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  QRTituloOriginalRep.Close;
  QRTitulosReparceladosCP.Close;
  end;

end;

end.

