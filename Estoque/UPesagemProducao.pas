unit UPesagemProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, CPort, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;


type
  TFPesagemProducao = class(TFTCadSimples)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MEProduto: TMaskEdit;
    METara: TMaskEdit;
    MEPeso: TMaskEdit;
    EdProduto: TEdit;
    SpeedButton2: TSpeedButton;
    MEDtFabricacao: TMaskEdit;
    MELote: TMaskEdit;
    MEDtValidade: TMaskEdit;
    PesagemdaProduo1: TMenuItem;
    SBPesoPadrao: TSpeedButton;
    ComPort1: TComPort;
    rgPesagem: TRadioGroup;
    Label1: TLabel;
    Reimpressodeetiquetadepesagem1: TMenuItem;
    Label8: TLabel;
    MeMensagem: TEdit;
    CancelaEtiquetaemLote1: TMenuItem;
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure Contar(ms : longint);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    Procedure ImpEtiqueta;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PesagemdaProduo1Click(Sender: TObject);
    procedure SBPesoPadraoClick(Sender: TObject);
    procedure rgPesagemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Reimpressodeetiquetadepesagem1Click(Sender: TObject);
    procedure CancelaEtiquetaemLote1Click(Sender: TObject);

  private
    { Private declarations }       

  public
    { Public declarations }
  end;

var
  FPesagemProducao: TFPesagemProducao;
  wStr, wImprime, wTipoPeso : string;
  wCont  : integer;
  wZerouBalanca :Boolean = false;
  wPesoFinal,wPesoAnterior : Real;

implementation

uses UProduto_cl,UBiblioteca, UOracle_cl, UTipoLote_cl,
  UProdutoCons, UProdutoParam, UUsuario_cl, UEstoque_cl, StrUtils;

{$R *.dfm}

function RemoveZeros(S: string): string;
//
// Remove os zeros a frente de um valor
//
var
I, J : Integer;
begin
I := Length(S);
while (I > 0) and (S[I] <= ' ') do
      begin
      Dec(I);
      end;
J := 1;
while (J < I) and ((S[J] <= ' ') or (S[J] = '0')) do
      begin
      Inc(J);
      end;
Result := Copy(S, J, (I-J)+1);
end;

function ReplaceStr(Sstring: string; OldChar, NewChar: char): string;
//
// Substitui um carctere por outro em uma string
//
var
Temp: string;
I: integer;
begin
Temp := '';
for I := 1 to Length (Sstring) do
    begin
    if Sstring[I] <> OldChar then
       begin
       Temp := Temp + Sstring[I];
       end
    else
       begin
       Temp := Temp + NewChar;
       end;
    end;
Result := Temp;
end;

procedure TFPesagemProducao.Contar(ms : longint);
var OTempo : LongInt;
begin
  OTempo := GetTickCount + ms;
  while GetTickCount < OTempo do Application.ProcessMessages;
end;

Procedure TFPesagemProducao.ImpEtiqueta;
var
  wcliente, wCodProduto,wDescProduto,wqtde,wdata,wbarra, wBarra1, sVias, wIndPeso: String;
  F: TextFile;
  w, wPeso, wAux, wPesoPadrao, wTemperatura: String;
  wContRegistro : integer;
begin
  wTemperatura := '';
  with DMProduto do
  Begin
    wIndPeso := DMOracle.BuscaNome('SELECT IND_PESO_PADRAO FROM TB_PRODUTO','COD_PRODUTO='+Trim(MeProduto.Text));
    wPesoPadrao := DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MIN FROM TB_PRODUTO','COD_PRODUTO='+ Trim(MeProduto.Text));
    wTemperatura := DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO='+Trim(MeProduto.Text));

    wPesoAnterior := wPesoFinal;

    QPesagemProducao.Open;

    if QPesagemProducao.RecordCount = 0 then
    begin
      QPesagemProducao.Close;
      QPesagemProducao.Open;
      QPesagemProducao.Insert;
      QPesagemProducaoCOD_FILIAL.Value := 2;
      QPesagemProducaoCOD_PRODUTO.Value := StrToInt(FPesagemProducao.MeProduto.Text);
      QPesagemProducaoCOD_LOTE_TIPO.Value := StrToInt(MELote.Text);
      QPesagemProducaoNUM_PESO_TARA.Value := StrToFloat(FPesagemProducao.MeTara.Text);
      if wIndPeso = 'S' then
        QPesagemProducaoNUM_PESO_LIQUIDO.Value := StrToFloat(wPesoPadrao)
      else
        QPesagemProducaoNUM_PESO_LIQUIDO.Value := StrToFloat(FormatFloat('###,###,##0.00',(wPesoFinal - StrToFloat(FPesagemProducao.METara.Text))));
      if StrToDate(MEDtFabricacao.Text) > Date then
      Begin
        Raise Exception.Create('A Data de Fabricação não pode ser maior que a data atual!');
        QPesagemProducao.Cancel;
      end;
      QPesagemProducaoDT_FABRICACAO.Value := StrToDate(MEDtFabricacao.Text);
      QPesagemProducaoIND_SITUACAO.Value := 'CONFIRMADO';
      QPesagemProducaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QPesagemProducaoDT_PESAGEM.Value := DMOracle.DataHoraServ;
      QPesagemProducao.Post;
    end;
    wDescProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+Trim(FPesagemProducao.MeProduto.Text));
    //cod. barras usado por nós
    wPeso := copy(QPesagemProducaoNUM_PESO_LIQUIDO.Text,1,2)+ copy(QPesagemProducaoNUM_PESO_LIQUIDO.Text,4,2);
    if Length(wPeso) = 3 then
      wPeso := wPeso + '0';
    if Length(wPeso) = 2 then
      wPeso := wPeso + '00';
    wBarra := bib.StrZero(QPesagemProducaoCOD_PESAGEM.Text,7)+bib.StrZero(QPesagemProducaoCOD_PRODUTO.Text,3)+wPeso;

    //cod. barras registrado
    wBarra1 := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO','COD_PRODUTO ='+QPesagemProducaoCOD_PRODUTO.Text);

    sVias := '1';

    //imprimir na zebra S4M
    AssignFile(F,'LPT1');
    Rewrite(F);
    Writeln(F,'^XA');
    Writeln(F,'^XA');
    Writeln(F,'^PRC^FS');
    Writeln(F,'^LH16,1^FS');
    Writeln(F,'^LL424^FS');
    Writeln(F,'^PQ'+ Trim(SVIAS) +'^FS'); // Numero de vias
    Writeln(F,'^FO016,038^A0N,35,30^FD'+wDescProduto+'^FS');
    Writeln(F,'^FO016,078^BEN,120,Y,N^FD'+wBarra1+'^FS'); // Variavel contendo o código de barra
    If wTemperatura <> '' then
    Begin
      Writeln(F,'^FO306,088^ADN,25,15^FDCONSERVACAO^FS');
      Writeln(F,'^FO306,108^A0N,35,35^FD'+wTemperatura +'^FS');
    end;
    Writeln(F,'^FO680,088^BCR,110,Y,N^FD'+wBarra+'^FS'); // Variavel contendo o código de barra

//    Writeln(F,'^FO016,255^ADN,20,10^FDReg. Ministerio da Agricultura SIF/DIPOA nr.0006/673^FS');
    Writeln(F,'^FO016,255^ADN,20,10^FD'+FPesagemProducao.MeMensagem.Text+'^FS');

    Writeln(F,'^FO016,295^ADN,25,15^FDFABRIC.^FS');
    Writeln(F,'^FO280,295^ADN,25,15^FDVALIDADE^FS');
    Writeln(F,'^FO500,295^ADN,25,15^FDLOTE^FS');
    Writeln(F,'^FO016,315^A0N,35,35^FD'+FPesagemProducao.MeDtFabricacao.Text+'^FS');
    Writeln(F,'^FO280,315^A0N,35,35^FD'+FPesagemProducao.MeDtValidade.Text+'^FS');
    if(trim(FPesagemProducao.MeLote.Text) <> '') then
      Writeln(F,'^FO520,315^A0N,35,35^FD'+FPesagemProducao.MeLote.Text+'^FS')
    else
      Writeln(F,'^FO520,315^A0N,35,35^FD'+QPesagemProducaoCOD_LOTE_TIPO.Text+'^FS');
    Writeln(F,'^FO016,410^ADN,25,15^FDP.BRUTO^FS');
    Writeln(F,'^FO286,410^ADN,25,15^FDTARA^FS');
    Writeln(F,'^FO476,410^ADN,25,15^FDP.LIQ.^FS');
    Writeln(F,'^FO016,440^A0N,50,40^FD'+FloatToStr(QPesagemProducaoNUM_PESO_LIQUIDO.Value +QPesagemProducaoNUM_PESO_TARA.Value)+'Kg'+'^FS');
    Writeln(F,'^FO286,440^A0N,50,40^FD'+FloatToStr(QPesagemProducaoNUM_PESO_TARA.Value)+'Kg'+'^FS');
    Writeln(F,'^FO496,440^A0N,50,40^FD'+FloatToStr(QPesagemProducaoNUM_PESO_LIQUIDO.Value)+'Kg'+'^FS');

    Writeln(F,'^FO016,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO086,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO156,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO226,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO296,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO366,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO436,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO506,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO576,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO646,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');
    Writeln(F,'^FO716,510^A0N,20,15^FD'+QPesagemProducaoCOD_PESAGEM.Text +'^FS');

    Writeln(F,'^XZ');
    CloseFile(F);

    //foi feito uma trigger para atualizar o estoque - TR_PESAGEM_PRODUCAO_A
    //DMEstoque.AtualizaEstoque(-2,2,StrToInt(FPesagemProducao.MeProduto.Text),1,StrToFLoat(QPesagemProducaoNUM_PESO_LIQUIDO.Text),0,0,0);

    DMOracle.DBCemapa.Commit;
    QPesagemProducao.Close;
    QPesagemProducao.SetVariable(':PK',0);
    QPesagemProducao.Open;

    inc(wContRegistro);
    //MeProduto.Text := '';
    if(wContRegistro = 100) then
    begin
      try
        wContRegistro := 0;
        DMOracle.DBCemapa.Connected := false;
        DMOracle.DBCemapa.Connected := true;
      Except
        Raise Exception.Create('Cursor não atualizado')
      end;
    end;
    //  rotina para impressora zebra tlp2844
   {  AssignFile(F,'LPT1');
      Rewrite(F);
      writeLN(F,'N');
      writeLN(F,'Q4,0,0');
      writeLN(F,'A50,30,0,2,1,3,N,"'+wDescProduto+'"');
      writeLN(F,'B50,80,0,1,4,4,70,B,"'+wBarra+'"');
      writeLN(F,'A50,200,0,1,2,3,N,"FABRICACAO    VALIDADE      LOTE"');
      writeLN(F,'A50,240,0,1,2,3,N,"'+DateToStr(DATE)+'    '+FPesagemProducao.MeDtValidade.Text+'    '+MeLote.Text +'"');
      writeLN(F,'A50,310,0,1,2,3,N,"PESO BRUTO    TARA     PESO LIQ."');
      writeLN(F,'A50,350,0,1,2,3,N,"'+FloattoStr(QPesagemProducaoNUM_PESO_LIQUIDO.Value + QPesagemProducaoNUM_PESO_TARA.Value)+
                                       'Kg        ' +QPesagemProducaoNUM_PESO_TARA.Text+
                                        'Kg      '+QPesagemProducaoNUM_PESO_LIQUIDO.Text+'Kg"');
      writeLN(F,'B100,420,0,E30,3,4,70,B,"'+wBarra1+'"');
      writeLN(F,'P1');
      CloseFile(F);}

    wImprime := 'S';
  end;
end;

procedure TFPesagemProducao.ComPort1RxChar(Sender: TObject;
  Count: Integer);
Var
wAux, wPeso, wIndPeso : string;
wMin, wMax : Real;
wValidade : integer;
begin
  inherited;

  While Trim(MeLote.Text) = '' do
  Begin
    contar(1000);
  end;
  wAux := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+ MeLote.Text);
  if Trim(MeProduto.Text) <> '' then
    wIndPeso := DMOracle.BuscaNome('SELECT IND_PESO_PADRAO FROM TB_PRODUTO','COD_PRODUTO ='+Trim(MeProduto.Text));
  if wAux = '' then
  Begin
    DMTipoLote.QTipoLote.CLose;
    DMTipoLote.QTipoLote.Open;
    DMTipoLote.QTipoLote.Insert;
    DMTipoLote.QTipoLoteCOD_LOTE_TIPO.Value := StrToInt(MELote.text);
    DMTipoLote.QTipoLoteDESC_LOTE.Value := MeLote.Text;
    DMTipoLote.QTipoLote.Post;
  end;

  wCont := 0;
  if ((Trim(MEProduto.Text) <> '') and (wIndPeso = 'N')) then
  Begin
    wMin := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MIN FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.text));
    wMax := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MAX FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.Text));
    EdProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text);
    MeTara.Text := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.text);
    wValidade := StrToInt(DMOracle.BuscaNome('SELECT NUM_DIAS_VALIDADE FROM TB_PRODUTO ','COD_PRODUTO='+MEProduto.Text));
    MEDtValidade.Text := DateToStr(StrToDate(MEDtFabricacao.Text) + wValidade - 1);

    ComPort1.ReadStr(wStr,1);
    while wStr <> 'S' do
      Comport1.ReadStr(wStr,1);
    if wStr = 'S' then
    Begin
      contar(40);
      MEPeso.Text := MEPeso.Text + wStr;
      ComPort1.ReadStr(wStr,1);

      if (wStr = 'Ô') then
      Begin
        MePeso.Text := MEPeso.Text + wStr;
        if wStr = 'Ô' then
          While (wStr <> '') do
          Begin
            contar(40);
            ComPort1.ReadStr(wStr,1);
            MePeso.Text := MEPeso.Text + wStr;
          end;

        wAux := Copy(MePeso.Text,8,7);
        wPeso := ReplaceStr(wAux,'±','1');
        wPeso := ReplaceStr(wPeso,'²','2');
        wPeso := ReplaceStr(wPeso,'3','3');
        wPeso := ReplaceStr(wPeso,'´','4');
        wPeso := ReplaceStr(wPeso,'5','5');
        wPeso := ReplaceStr(wPeso,'6','6');
        wPeso := ReplaceStr(wPeso,'·','7');
        wPeso := ReplaceStr(wPeso,'¸','8');
        wPeso := ReplaceStr(wPeso,'9','9');
        wPeso := ReplaceStr(wPeso,'0','0');
        wPesoFinal := StrtoFloat(ReplaceStr(wPeso,'.',','));

        if((wTipoPeso = 'L') and (wPesoFinal = 0.00)) then
        begin
            wZerouBalanca := true;
        end;

        wCont := 0;
        ComPort1.ClearBuffer(true,true);
        MePeso.Text := '';

        if ((wImprime = 'S') and (wPesoFinal > (wPesoAnterior + 0.10)) or (wPesoFinal < (wPesoAnterior - 0.10))) then
          wImprime := 'N';
      end;
    end;
    if(wTipoPeso = 'L') then
    begin
      if ((wPeso <> '') and (StrToFloat(ReplaceStr(wPeso,'.',',')) > wMin) and
          (StrToFloat(ReplaceStr(wPeso,'.',',')) < wMax) and (wImprime = 'N') and (wZerouBalanca)) then
      begin
        ImpEtiqueta;
        wZerouBalanca := false;
      end;
    end
    else
      if ((wPeso <> '') and (StrToFloat(ReplaceStr(wPeso,'.',',')) > wMin) and
          (StrToFloat(ReplaceStr(wPeso,'.',',')) < wMax) and (wImprime = 'N')) then
      begin
        ImpEtiqueta;
      end;
  end;
end;

procedure TFPesagemProducao.FormActivate(Sender: TObject);

begin
  inherited;
  wImprime := 'N';
  MEDtFabricacao.Text := DateToStr(Date - 1);
  wCont := 0;
  wTipoPeso := bib.leArquivoConf('peso');
  try
    ComPort1.Open;
  except
    MessageDlg('Impressora não conectada', mtInformation, [mbOK], 0);
  end;
end;

procedure TFPesagemProducao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
    begin
      MEProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
      MEProdutoExit(Self);
    end;
end;

procedure TFPesagemProducao.MEProdutoExit(Sender: TObject);
var
wPesoPadrao : string;
wValidade : integer;
begin
  inherited;
  if Trim(MEProduto.text)<>'' then
  Begin
    EdProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                     'COD_PRODUTO = '+MEProduto.text);
    MeTara.Text := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.text);
  end
  else
    EdProduto.Clear;

   wPesoPadrao := DMOracle.BuscaNome('SELECT IND_PESO_PADRAO FROM TB_PRODUTO','COD_PRODUTO='+Trim(MeProduto.Text));
   if wPesoPadrao = 'S' then
   Begin
     SBPesoPadrao.Enabled := True;
     SBPesoPadrao.Visible := True;
     wValidade := StrToInt(DMOracle.BuscaNome('SELECT NUM_DIAS_VALIDADE FROM TB_PRODUTO ','COD_PRODUTO='+MEProduto.Text));
     MEDtValidade.Text := DateToStr(StrToDate(MEDtFabricacao.Text) + wValidade - 1);
     MeTara.Text := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.text);
   end
   else
   Begin
     SBPesoPadrao.Visible := False;
     SBPesoPadrao.Enabled := False;
     wValidade := StrToInt(DMOracle.BuscaNome('SELECT NUM_DIAS_VALIDADE FROM TB_PRODUTO ','COD_PRODUTO='+MEProduto.Text));
     MEDtValidade.Text := DateToStr(StrToDate(MEDtFabricacao.Text) + wValidade - 1);
     MeTara.Text := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO='+MEProduto.text);
   end;
end;

procedure TFPesagemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ComPort1.Close;
  MEDtFabricacao.Text := '';
  MEDtValidade.Text := '';
  MeProduto.Text := '';
  METara.Text := '';
end;

procedure TFPesagemProducao.PesagemdaProduo1Click(Sender: TObject);
var
wPeso, wProduto, wAtualizaEstoque : string;
begin
  inherited;
  if FProdutoParam = Nil then
     FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[24].TabVisible:=true;

  if FProdutoParam.Showmodal = mrOk then
  Begin
    DMProduto.QPesagemProducao.Close;
    DMProduto.QPesagemProducao.SetVariable('PK',Trim(FProdutoParam.ME24Codigo.Text));
    DMProduto.QPesagemProducao.Open;
    wPeso := DMProduto.QPesagemProducaoNUM_PESO_LIQUIDO.Text;
    wProduto := DMProduto.QPesagemProducaoCOD_PRODUTO.Text;
    wAtualizaEstoque := '';
    if FProdutoParam.rg24Cancelamento.ItemIndex = 0 then
      wAtualizaEstoque := 'SIM'
    else
      if FProdutoParam.rg24Cancelamento.ItemIndex = 1 then
        wAtualizaEstoque := 'NAO';
    if DMProduto.QPesagemProducaoIND_SITUACAO.Text = 'CANCELADA' then
      Raise Exception.Create('Essa Etiqueta já foi Cancelada!');
    if DMProduto.QPesagemProducaoIND_SITUACAO.Text = 'EMBARCADO' then
      Raise Exception.Create('Essa Etiqueta já foi Embarcada!');
    if DMProduto.QPesagemProducaoIND_SITUACAO.Text = 'CONFIRMADO' then
    Begin
      try
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = ' + chr(39) + 'CANCELADA' + chr(39));
        DMOracle.QExecSQL.SQL.Add(', IND_BAIXAR_ESTOQUE = ' + chr(39) + wAtualizaEstoque + chr(39));
        DMOracle.QExecSQL.SQL.Add(' WHERE COD_PESAGEM = ' + FProdutoParam.ME24Codigo.Text);
        DMOracle.QExecSQL.ExecSQL;
        //FOI COLOCADO UMA TRIGGER NO BANCO DE DADOS - TR_PESAGEM_PRODUCAO_A
        //DMEstoque.AtualizaEstoque(-2,2,StrToInt(wProduto),1,StrToFLoat(wPeso)* -1,0,0,0);
        DMOracle.DBCemapa.Commit;
        ShowMessage('OK! CANCELADA!');
      Except
        DMOracle.DBCemapa.Rollback;
        Raise Exception.Create('A etiqueta não foi cancelada.Feche e Tente de Novo');
      end;
    end;  
  end;
end;

procedure TFPesagemProducao.SBPesoPadraoClick(Sender: TObject);
begin
  inherited;
  ImpEtiqueta;
end;

procedure TFPesagemProducao.rgPesagemClick(Sender: TObject);
var
  wTipoPesagem :String;
begin
  inherited;
  wTipoPesagem := '';
  if rgPesagem.ItemIndex = 0 then
    wTipoPesagem := 'R'
  else
    wTipoPesagem := 'L';
  Bib.escreveArquivoConf('peso',wTipoPesagem);
  showMessage('O sistema deve ser reiniciado para que a nova configuração entre em vigor');
end;

procedure TFPesagemProducao.FormCreate(Sender: TObject);
begin
  inherited;
  if DMUsuario.Privilegiado then
    rgPesagem.Enabled := true
  else
    rgPesagem.Enabled := false;
end;

procedure TFPesagemProducao.Reimpressodeetiquetadepesagem1Click(
  Sender: TObject);
var
  wValidade :Integer;
begin
  inherited;
  if FProdutoParam = Nil then
     FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[30].TabVisible:=true;

  if FProdutoParam.Showmodal = mrOk then
  Begin
    with DMProduto do
    begin
      MELote.Text := '';
      MEProduto.Text := QPesagemProducaoCOD_PRODUTO.Text;
      MEDtFabricacao.Text := QPesagemProducaoDT_FABRICACAO.Text;
      wValidade := StrToInt(DMOracle.BuscaNome('SELECT NUM_DIAS_VALIDADE FROM TB_PRODUTO ','COD_PRODUTO='+MEProduto.Text));
      MEDtValidade.Text := DateToStr(StrToDate(MEDtFabricacao.Text) + wValidade - 1);
      METara.Text := QPesagemProducaoNUM_PESO_TARA.Text;
      MEPeso.Text := QPesagemProducaoNUM_PESO_LIQUIDO.Text;
    end;
    ImpEtiqueta;
  end;
end;

procedure TFPesagemProducao.CancelaEtiquetaemLote1Click(Sender: TObject);
var
  wIni, wFim, wAux: String;
begin
  inherited;
  if FProdutoParam = Nil then
     FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.AtivaPagina(34);
  if FProdutoParam.Showmodal = mrOk then
  Begin
    wIni := FProdutoParam.ME34PesagemIni.Text;
    wFim := FProdutoParam.ME34PesagemFim.Text;

    if not ((wIni > '0') and (wFim > '0') and (wFim >= wIni)) then
    begin
      MessageDlg('Intervalo inválido', mtError, [mbOK], 0);
      Exit;
    end;

    Buscador.Limpa;
    Buscador.Adiciona('COUNT(*)', 'TB_PESAGEM_PRODUCAO',
      'IND_SITUACAO <> ' + QuotedStr('CONFIRMADO') + ' AND ' +
      'COD_PESAGEM BETWEEN ' + wIni + ' AND ' + wFim);
    Buscador.Adiciona('COUNT(*)', 'TB_PESAGEM_PRODUCAO',
      'COD_PESAGEM BETWEEN ' + wIni + ' AND ' + wFim);
    Buscador.Buscar;

    wAux := Buscador.Proximo;
    if wAux > '0' then
    begin
      MessageDlg('Existem ' + wAux + ' etiquetas já canceladas ou embarcadas neste intervalo.',
        mtError, [mbOK], 0);
      Exit;
    end;
    wAux := Buscador.Proximo;
    if wAux > '0' then
    begin
      if (MessageDlg('Serão canceladas ' + wAux + ' etiquetas. Continuar?',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
        Exit;
    end
    else
    begin
      MessageDlg('Não existem etiquetas para cancelar neste intervalo.', mtInformation, [mbOK], 0);
      Exit;
    end;

    wAux := IfThen(FProdutoParam.RG34AtualizarEstoque.ItemIndex = 0, 'SIM', 'NAO');
    DMOracle.ExecutaSql('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = ' + QuotedStr('CANCELADA') +
        ', IND_BAIXAR_ESTOQUE = ' + QuotedStr(wAux) +
        ' WHERE COD_PESAGEM BETWEEN ' + wIni + ' AND ' + wFim);

    MessageDlg('Etiquetas canceladas.', mtInformation, [mbOK], 0);
  end;
end;

end.

