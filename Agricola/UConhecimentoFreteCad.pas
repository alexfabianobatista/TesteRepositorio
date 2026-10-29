unit UConhecimentoFreteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFConhecimentoFreteCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtConsNota: TBitBtn;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    RelatrioConhecimentoFretePContrato1: TMenuItem;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    RelatrioConhecimentoFreteSContrato1: TMenuItem;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    BitBtn2: TBitBtn;
    DBDirceu1: TDBDirceu;
    Opes1: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    VoltaContasaPagar1: TMenuItem;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    BitBtn3: TBitBtn;
    DBDirceu2: TDBDirceu;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    GeraContsaPagarComplemento1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    DBEdit8: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    BitBtn4: TBitBtn;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    BtConsEntrada: TBitBtn;
    DBEdit28: TDBEdit;
    RelatrioGerencialdeFretesIntermunicipais1: TMenuItem;
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioConhecimentoFretePContrato1Click(Sender: TObject);
    procedure RelatrioConhecimentoFreteSContrato1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure VoltaContasaPagar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtConsNotaClick(Sender: TObject);
    procedure GeraContsaPagarComplemento1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtConsEntradaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBEdit28Change(Sender: TObject);
    procedure RelatrioGerencialdeFretesIntermunicipais1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteCad: TFConhecimentoFreteCad;

implementation

uses UConhecimentoFrete_cl, UNotaSaidaCons, UContratoVenda_Cons,
  UNotaSaida_cl, Ucontrato_cl, UConhecimentoFretecons,
  UConhecimentoFreteParam, UrConhecimentoFrete, UContrato_Param,
  UrConhecimentoFreteSContrato, UOracle_cl, UCadastroCons, UContrato_CP,
  UCadastro_cl, UFilialCons, UFilial_cl, UOperacaoCons, UOperacao_cl,
  UPlanilha_cl, UNotaEntradaCons, UNotaEntrada_cl, UUsuario_cl,
  UParamSistema_cl, URGerenciaConhecimento;

{$R *.DFM}

procedure TFConhecimentoFreteCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFConhecimentoFreteCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFConhecimentoFreteCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimentoFrete.QConhecimentoFrete.Open;
end;

procedure TFConhecimentoFreteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimentoFrete.QConhecimentoFrete.Close;
  Action := CaFree;
  FConhecimentoFreteCad := Nil;
end;

procedure TFConhecimentoFreteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteCons = nil then
    FConhecimentoFreteCons := TFConhecimentoFreteCons.Create(Application);
  if FConhecimentoFreteCons.ShowModal = mrOk then
   begin
     with DMConhecimentoFrete do
      begin
        QConhecimentoFrete.Close;
        QConhecimentoFrete.SetVariable('PK',QConhecimentoFreteConsCOD_CONHECIMENTO_FRETE.Value);
        QConhecimentoFrete.Open;
      end;
   end;
end;

procedure TFConhecimentoFreteCad.RelatrioConhecimentoFretePContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FConhecimentoFreteParam.ShowModal =  mrOk then
   begin
     with DMConhecimentoFrete do
       begin
        QRConhecimentoFrete.Close;
        If Trim(FConhecimentoFreteParam.ME1CodContrato.text) <>'' then
          QRConhecimentoFrete.SetVariable('COD_CONTRATO',FConhecimentoFreteParam.ME1CodContrato.text)
        else
          QRConhecimentoFrete.SetVariable('COD_CONTRATO',Null);
        QRConhecimentoFrete.Open;
        If FRConhecimentoFrete = Nil then
          FRConhecimentoFrete := TFRConhecimentoFrete.Create(Application);
        If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
          FRConhecimentoFrete.QRPrimario.Preview
        else
          FRConhecimentoFrete.QRPrimario.Print;
        QRConhecimentoFrete.Close;
       end;
   end;
end;

procedure TFConhecimentoFreteCad.RelatrioConhecimentoFreteSContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FConhecimentoFreteParam.ShowModal =  mrOk then
    begin
      with DMConhecimentoFrete do
        begin
          QRConhecimentoSContrato.Close;
          QRConhecimentoSContrato.SetVariable('DATA_I',FConhecimentoFreteParam.ME2DtInicial.Text);
          QRConhecimentoSContrato.SetVariable('DATA_F',FConhecimentoFreteParam.ME2DtFinal.Text);
          If FConhecimentoFreteParam.ME2CodCliente.Text <> '' then
             QRConhecimentoSContrato.SetVariable('COD_CADASTRO',FConhecimentoFreteParam.ME2CodCliente.Text)
          Else
             QRConhecimentoSContrato.SetVariable('COD_CADASTRO',Null);
          QRConhecimentoSContrato.Open;
          If FRConhecimentoFreteSContrato = Nil then
            FRConhecimentoFreteSContrato := TFRConhecimentoFreteSContrato.Create(Application);
          FRConhecimentoFreteSContrato.QRLTitulo.Caption := 'Relatório de Conhecimentos de Frete de ' + FConhecimentoFreteParam.ME2DtInicial.Text + ' Até ' + FConhecimentoFreteParam.ME2DtFinal.Text;
          If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
            FRConhecimentoFreteSContrato.QRPrimario.Preview
          else
            FRConhecimentoFreteSContrato.QRPrimario.Print;
          QRConhecimentoSContrato.Close;
        end;
    end;
end;

procedure TFConhecimentoFreteCad.SBConfirmarClick(Sender: TObject);
Var wCod_Conhecimento_Frete,wCodNota : String;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
  wCodNota := DMOracle.BuscaNome('SELECT NUM_RPA FROM TB_RPA','COD_NOTA_CAB = '+DBEdit2.Text);
  If wCodNota <> '' Then
     Raise Exception.Create('Nota Com RPA');
  If DBEdit2.Text <> '' Then
   Begin
     wCod_Conhecimento_Frete :=DMOracle.BuscaNome('SELECT COD_CONHECIMENTO_FRETE FROM TB_CONHECIMENTO_FRETE','COD_NOTA_CAB=' +DBEdit2.Text);
     If (wCod_Conhecimento_Frete <> '') And (wCod_Conhecimento_Frete <> DBEdit1.Text) Then   // na alteração cod_nota_cab da tela = cod_nota_tela no banco de dados
      Begin                                                              // esta rotina preve inclusao e alteração
        If MessageBox (0,'Nota Fiscal com Conhecimento de Frete Já Lançado, Duplicar?','Opção',MB_YESNO) = MrYes Then
           inherited
        Else
           DSPrimario.DataSet.Cancel
      End
     Else
       Inherited
   End
  Else
   Inherited;
end;

procedure TFConhecimentoFreteCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFConhecimentoFreteCad.GeraContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value<>0 then
  Begin
     Try
      DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimentoFrete.QConhecimentoFreteDt_Recebimento.Value Then
         Raise Exception.Create('Não é Permitido Lançar Este Conhecimento - Fechamento Contabil');

      If not(DMOracle.DBcemapa.InTransaction) then
        DMOracle.DBCemapa.StartTransaction;
      If DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB','COD_CONHECIMENTO_FRETE =' +FloatToStr(DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.VALUE)+' AND NUM_PARCELA=1') = '' Then
      begin
        If FContrato_CP = Nil then
          FContrato_CP := TFContrato_CP.Create(Application);
        FContrato_CP.pTipo:='CNH'; // CONHECIMENTO DE FRETES
        FContrato_CP.ShowModal;
      End;
      With DMOperacao do
      Begin
        QOperacao.Close;
        QOperacao.SetVariable('PK',DMConhecimentoFrete.QConhecimentoFreteCod_Operacao.Value);
        QOperacao.Open;
      End;
      With DMConhecimentoFrete do
      Begin
        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value),
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value,
                             'DEBITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVal_frete_total_tela.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value);
        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value),
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value,
                             'CREDITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVal_frete_total_tela.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value);
        If QConhecimentoFreteVal_Icms.Value <> 0 Then
        Begin
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_DEB.Value,
                               'DEBITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               QConhecimentoFreteVal_Icms.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_CRED.Value);
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_CRED.Value,
                               'CREDITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               QConhecimentoFreteVal_Icms.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_DEB.Value);
        End;
      End;
      DMConhecimentoFrete.QConhecimentoFrete.Edit;
      DMConhecimentoFrete.QConhecimentoFreteInd_Situacao.Value := '2';
      DMConhecimentoFrete.QConhecimentoFrete.Post;
      DMOracle.DBCemapa.Commit;
     Except
        DMOracle.DBcemapa.Rollback;
        Raise;
     End;
  End
  Else
    ShowMessage('Erro! Conhecimento de frete, Selecione um contrato.');
end;

procedure TFConhecimentoFreteCad.VoltaContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCod_Conhecimento_Frete.Value<>0 then
    begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMConhecimentoFrete do
            begin
              QContaPagarCab.Close;
              QContaPagarCab.SetVariable('COD_CONHECIMENTO_FRETE',QConhecimentoFreteCod_Conhecimento_Frete.Value);
              QContaPagarCab.Open;
              QContaPagarMov.Close;
              QContaPagarMov.Open;
              While not QContaPagarCab.Eof do
                Begin
                  If QContaPagarMovInd_Tipo_Movimento.Value <> '' Then
                    Begin
                      If (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                      Else
                        QContaPagarMov.Delete;
                    End;
                  QContaPagarCab.Delete;
                End;
              DMPlanilha.DesContabiliza(Trunc(QConhecimentoFreteCod_Conhecimento_Frete.Value),'CNH');
              DMConhecimentoFrete.QConhecimentoFrete.Edit;
              DMConhecimentoFrete.QConhecimentoFreteInd_Situacao.Value := '1';
              DMConhecimentoFrete.QConhecimentoFrete.Post;
              DMOracle.DBCemapa.Commit;
           end;
        Except
          DMOracle.DBCemapa.Rollback;
          ShowMessage('Não foi possivel voltar Contas a Pagar!');
          Raise;
        End;
    end;
end;

procedure TFConhecimentoFreteCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFConhecimentoFreteCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BitBtn1.Enabled:=True;
      BitBtn2.Enabled:=True;
      BitBtn3.Enabled:=True;
      BitBtn4.Enabled:=True;
      BtConsNota.Enabled:=True;
      BtConsEntrada.Enabled:=True;
    end
  else
    begin
      BitBtn1.Enabled:=False;
      BitBtn2.Enabled:=False;
      BitBtn3.Enabled:=False;
      BitBtn4.Enabled:=False;
      BtConsNota.Enabled:=False;
      BtConsEntrada.Enabled:=False;
    end;

end;

procedure TFConhecimentoFreteCad.BtConsNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFConhecimentoFreteCad.GeraContsaPagarComplemento1Click(
  Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value<>0 then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
      If DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB','COD_CONHECIMENTO_FRETE =' +FloatToStr(DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.VALUE)+' AND NUM_PARCELA=2') = '' Then
        begin
          If not(DMOracle.DBcemapa.InTransaction) then
            DMOracle.DBCemapa.StartTransaction;
          If FContrato_CP=Nil then
            FContrato_CP := TFContrato_CP.Create(Application);
          FContrato_CP.pTipo:='CFC'; // CONHECIMENTO DE FRETES COMPLEMENTO
          FContrato_CP.ShowModal;
          If DMOracle.DBcemapa.InTransaction then
            Begin
              DMOracle.DBcemapa.Rollback;
              ShowMessage('Atenção! Este Contrato não gerou um Contas a Pagar.');
            End;
        End
      Else
        ShowMessage('Erro! Este Conhecimento de frete já gerou um Contas a Pagar.');
    End
  Else
    ShowMessage('Erro! Conhecimento de frete, Selecione um contrato.');
end;
procedure TFConhecimentoFreteCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFConhecimentoFreteCad.BtConsEntradaClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Value;

end;

procedure TFConhecimentoFreteCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFConhecimentoFreteCad.DBEdit28Change(Sender: TObject);
begin
  inherited;
  With DMConhecimentoFrete do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QConhecimentoFreteInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QConhecimentoFreteInd_Situacao.Value = '2';
  End;
end;

procedure TFConhecimentoFreteCad.RelatrioGerencialdeFretesIntermunicipais1Click(
  Sender: TObject);
Var
  wstrAux : String;
begin
  inherited;
  with DMConhecimentoFrete do
  begin
    QRGerenciaConhecimento.close;
    If FConhecimentoFreteParam = nil then
    Begin
      FConhecimentoFreteParam:=TFConhecimentoFreteParam.create(application);
      FConhecimentoFreteParam.Me3DtInicio.Text := '01/' + FormatDateTime('MM/YYYY', Date);
      FConhecimentoFreteParam.Me3DtFim.Text := DateToStr(Date);
    End;
    FConhecimentoFreteParam.PGRelatorio.Pages[2].TabVisible := True;
    If FConhecimentoFreteParam.showmodal = mrOk then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoFreteParam.ME3CodFilial.Text),'CONHECIMENTO');

      If(Trim(FConhecimentoFreteParam.ME3CodFilial.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('FILIAL',Trim(FConhecimentoFreteParam.ME3CodFilial.Text))
      Else
        QRGerenciaConhecimento.SetVariable('FILIAL',null);

      If(Trim(FConhecimentoFreteParam.ME3CodProduto.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('PRODUTO',Trim(FConhecimentoFreteParam.ME3CodProduto.Text))
      Else
        QRGerenciaConhecimento.SetVariable('PRODUTO',null);

      wstrAux := '';
      Case FConhecimentoFreteParam.Rg3Situacao.ItemIndex Of
        0: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO','E');
             wstrAux := 'ENTRADAS';
           End;
        1: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO','S');
             wstrAux := 'SAÍDAS';
           End;
        2: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO',null);
             wstrAux := 'TODAS';
           End;
      End;

      QRGerenciaConhecimento.SetVariable('DT_INICIAL',Trim(FConhecimentoFreteParam.ME3DtInicio.Text));
      QRGerenciaConhecimento.SetVariable('DT_FINAL',Trim(FConhecimentoFreteParam.ME3DtFim.Text));
      QRGerenciaConhecimento.open;

      if FRGerenciaConhecimento = nil then
        FRGerenciaConhecimento := TFRGerenciaConhecimento.create(application);
      FRGerenciaConhecimento.QRLbFilial.Caption := 'Unidade: ' + Trim(FConhecimentoFreteParam.Ed3Filial.Text);
      FRGerenciaConhecimento.QRLbPeriodo.Caption := FConhecimentoFreteParam.ME3DtInicio.Text + ' Até ' + FConhecimentoFreteParam.ME3DtFim.Text;
      FRGerenciaConhecimento.QRLbFrete.Caption := 'Frete: ' + wstrAux;
      FRGerenciaConhecimento.QRLbProduto.Caption := 'Código Produto: ' + Trim(FConhecimentoFreteParam.Me3CodProduto.Text) + ' ' + FConhecimentoFreteParam.Ed3Produto.Text;
      if FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
        FRGerenciaConhecimento.QRPrimario.Preview
      else
        FRGerenciaConhecimento.QRPrimario.Print;
      QRGerenciaConhecimento.close;
    End;
  End;
end;

End.
