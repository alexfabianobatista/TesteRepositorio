unit UOrdemServicoFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, Db;

type
  TFOrdemServicoFecha = class(TForm)
    BtConfirma: TBitBtn;
    BtCancela: TBitBtn;
    PCFecha: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MEDtFechamento: TMaskEdit;
    Label1: TLabel;
    RGTipoPgto: TRadioGroup;
    Label2: TLabel;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label31: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    MEDiasCP: TMaskEdit;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label3: TLabel;
    METotalOS: TMaskEdit;
    Label7: TLabel;
    MeBanco: TMaskEdit;
    BtConsBanco: TBitBtn;
    EdBanco: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MeBancoExit(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Finaliza;
  public
    { Public declarations }
  end;

var
  FOrdemServicoFecha: TFOrdemServicoFecha;

implementation

uses UOrdemServico_cl, UOracle_cl, UDepartamentoCons, UDepartamento_cl,
  UContasReceber_cl, UBiblioteca, UFinalidade_cl, UFinalidadeCons,
  UCaixa_cl, UParamSistema_cl, UEstoque_cl, UBancoAgencia_cl, UBancosCons,
  UBloqueto;

{$R *.DFM}

procedure TFOrdemServicoFecha.FormCreate(Sender: TObject);
Var wCont : Byte;
begin
  MEDtFechamento.Text := DateToStr(Date);
  For wCont := 0 to PCFecha.PageCount - 1 do
  Begin
    PCFecha.Pages[wCont].TabVisible := False;
  End;
end;

procedure TFOrdemServicoFecha.FormDeactivate(Sender: TObject);
Var wCont : Byte;
begin
  For wCont := 0 to PCFecha.PageCount - 1 do
  Begin
    PCFecha.Pages[wCont].TabVisible := False;
  End;
End;

procedure TFOrdemServicoFecha.BtConfirmaClick(Sender: TObject);
begin
  Case PCFecha.ActivePage.PageIndex of
    0 : Begin
          If RGTipoPgto.ItemIndex = 0 Then
            Finaliza
          Else
          Begin
            PCFecha.Pages[0].TabVisible := False;
            PCFecha.Pages[1].TabVisible := True;
            ModalResult := mrNone;
          End;
        End;

    1 : Finaliza;

  End;
end;

procedure TFOrdemServicoFecha.Finaliza;
Var wCont  : Byte;
    wValor : String;
    wTotal : Real;
    wParcela : Byte;
begin
  wTotal := 0;
  wParcela := 0;
  With DMOrdemServico do
  Begin
    Try
      If RGTipoPgto.ItemIndex > 0 Then
      For wCont := 0 to LBContaReceber.Items.Count - 1 do
      Begin
        wValor := Copy(LBContaReceber.Items[wCont],11,15);
        wValor := Bib.LimpaString(wValor,'.');
        wTotal := wTotal + StrToFloat(wValor);
      End;
      If (wTotal <> QOrdemServicototal.Value) and (RGTipoPgto.ItemIndex = 1) Then
        Raise Exception.Create('Soma das parcelas diferente do total da OS!');
    Except
      ModalResult := mrNone;
      Raise;
    End;
    Try
      QOrdemServico.Edit;
      QOrdemServicoDt_Saida.Value := StrToDate(MEDtFechamento.Text);
      If RGTipoPgto.ItemIndex = 0 Then
      Begin  // Atualizar Caixa
        If QOrdemServicoTotal.Value  > 0 Then
          DMCaixa.IncluiCaixa(1,1,DMParamSistema.QParamSistemaCod_Historico_OS.Value,
                          QOrdemServicoTotal.Value,
                          QOrdemServicoCod_Ordem_Servico_Cab.Value,
                          QOrdemServicoCod_Cadastro.Value,
                          'Pagamento a Vista de OS');
      End
      Else // Atualiza Contas a Receber
        For wcont := 0 to LBContaReceber.Items.Count - 1 do
        Begin
          inc(wParcela);
          wValor := Copy(LBContaReceber.Items[wCont],11,15);
          wValor := Bib.LimpaString(wValor,'.');
          DMContasReceber.IncluiCR(0,QOrdemServicoCod_Ordem_Servico_Cab.Value,
                                   wParcela,StrToFloat(MEFinalidade.Text),
                                   StrToFloat(MEDepartamento.Text),
                                   StrToFloat(MeBanco.Text),
                                   QOrdemServicoCod_Cadastro.Value,
                                   1,StrToFloat(wValor),'OS',
                                   StrToDate(Copy(LBContaReceber.Items[wCont],1,10)),
                                   StrToDate(MEDtFechamento.Text) );
        End;
      // ** Atualizar Estoque **
      QOrdemServicoIt.First;
      While Not QOrdemServicoIt.Eof do
      Begin
        DMEstoque.AtualizaEstoque(-1,QOrdemServicoCod_Filial.Value,
                         QOrdemServicoItCod_Produto.Value,1,
                         QOrdemServicoItQt_Produto.Value*-1,
                         QOrdemServicoItvl_Total.Value*-1,0,QOrdemServicoDt_Saida.Value);
        QOrdemServicoIt.Next;
      End;
      QOrdemServico.Post;
      DMOracle.DBCemapa.Commit;
      If RGTipoPgto.ItemIndex = 1 Then
      Begin  // Emissão Bloqueto Bancario
        with DMContasReceber do
          begin
            QRBloqueto.Close;
            QRBloqueto.ParamByName('COD_BANCO_AGENCIA').asFloat:=StrToFloat(MeBanco.Text);

            QRBloqueto.ParamByName('COD_NOTA_CAB').Clear;

            QRBloqueto.ParamByName('COD_CONTA_RECEBER_CAB').asFloat:=QContasReceber_CabCod_Conta_Receber_Cab.Value;

            QRBloqueto.ParamByName('DT_INICIAL').Clear;

            QRBloqueto.ParamByName('DT_FINAL').Clear;

            QRBloqueto.Open;
            // Banco do Brasil
            if QRBloquetoCod_Banco.Value = 1 then
              Bloqueto.EmiteBloqueto(1);
            // Banco Bradesco
            if QRBloquetoCod_Banco.Value = 237 then
              Bloqueto.EmiteBloqueto(2);
            // Banco HSBC
            if QRBloquetoCod_Banco.Value = 399 then
              Bloqueto.EmiteBloqueto(4);
            // Banco Rural
            if QRBloquetoCod_Banco.Value = 453 then
              Bloqueto.EmiteBloqueto(3);
            // Caixa Economica
            if QRBloquetoCod_Banco.Value = 104 then
              Bloqueto.EmiteBloqueto(5);
            // Meridional
            if QRBloquetoCod_Banco.Value = 8 then
              Bloqueto.EmiteBloqueto(6);
          end;
      End;


      ModalResult := mrOk;
    Except
      If QOrdemServico.State in [dsEdit,dsInsert] Then
        QOrdemServico.Cancel; // RollBack
      // ModalResult := mrCancel;
      Raise;
    End;
  End;
end;

procedure TFOrdemServicoFecha.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;


end;

procedure TFOrdemServicoFecha.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFOrdemServicoFecha.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)
  Else
    EdFinalidade.Text := '';
end;

procedure TFOrdemServicoFecha.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFOrdemServicoFecha.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;
end;

procedure TFOrdemServicoFecha.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;

end;

procedure TFOrdemServicoFecha.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr(StrToFloat(MEDiasCP.Text)+StrToDate(MEDtFechamento.Text) );
    MEDiasCP.Text := '';
  End;
end;

procedure TFOrdemServicoFecha.FormActivate(Sender: TObject);
begin
  LBContaReceber.Items.Clear;
  METotalOS.Text := DMOrdemServico.QOrdemServicototal.Text;
end;

procedure TFOrdemServicoFecha.MeBancoExit(Sender: TObject);
begin
  If Trim(MEBanco.Text) <> '' Then
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text)
  Else
    EdBanco.Text := '';

end;

procedure TFOrdemServicoFecha.BtConsBancoClick(Sender: TObject);
begin
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.showModal = mrOk then
  Begin
    MEBanco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    MEBancoExit(Self);
  End;

end;

end.
