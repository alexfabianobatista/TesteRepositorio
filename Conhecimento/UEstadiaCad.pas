unit UEstadiaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFEstadiaCad = class(TFTCadSimples)
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    BtFilial: TSpeedButton;
    BtCadastro: TSpeedButton;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    BtRPA: TSpeedButton;
    BtFreteConhecimento: TSpeedButton;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    RelaoEstadias1: TMenuItem;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Operaes1: TMenuItem;
    ConfirmarEstadia1: TMenuItem;
    CancelarEstadia1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    LBSituacao: TLabel;
    Label22: TLabel;
    DBEdit24: TDBEdit;
    MeNumero: TMaskEdit;
    Label23: TLabel;
    EspelhoEstadia1: TMenuItem;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtRPAClick(Sender: TObject);
    procedure BtFreteConhecimentoClick(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure RelaoEstadias1Click(Sender: TObject);
    procedure ConfirmarEstadia1Click(Sender: TObject);
    procedure CancelarEstadia1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure EspelhoEstadia1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadiaCad: TFEstadiaCad;

implementation

uses UConhecimento_cl, UFilialCons, UCadastroCons, URPACons, URPA_cl,
  UConhecimentoFretecons, UConhecimentoFrete_cl, UFilial_cl, UCadastro_cl,
  UEstadiaCons, USequencia_cl, UEstadiaParam, URelacaoEstadia,
  UParamSistema_cl, UUsuario_cl, UOracle_cl, UEstadia_CP, UContasPagar_cl,
  UCaixaLanc_Cont, UPlanilha_cl, UBiblioteca, UConhecimentoCons,
  UrEstadiaEspelho;

{$R *.DFM}

procedure TFEstadiaCad.BtFilialClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
     DMConhecimento.QEstadiaCod_Filial.value:=DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFEstadiaCad.BtCadastroClick(Sender: TObject);
begin
  inherited;
   if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
     DMConhecimento.QEstadiaCod_Cadastro.value:=DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFEstadiaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  //desabilita menu de operacoes
  If DSPrimario.DataSet.State in [dsEdit,dsInsert] then
  Begin
    BtFilial.Enabled := True;
    BtCadastro.Enabled := True;
    BtRPA.Enabled := True;
    BtFreteConhecimento.Enabled := True;
    MMCadSimples.Items[2].Enabled := false;
  end
  else
  Begin
    BtFilial.Enabled := False;
    BtCadastro.Enabled := False;
    BtRPA.Enabled := False;
    BtFreteConhecimento.Enabled := False;
    MMCadSimples.Items[2].Enabled := true;
  end;
  LbSituacao.Caption := DMConhecimento.QEstadiaInd_Situacao.Value;
End;

procedure TFEstadiaCad.BtRPAClick(Sender: TObject);
begin
  inherited;
  if FRPACons = nil then
    FRPACons := TFRPACons.create(application);
  If FRPACons.showmodal = mrOk then
  begin
    if DMRPA.QRPAConsNUM_RPA.Value <> 0 then
    begin
      DMConhecimento.QEstadiaCOD_RPA.Value := DMRPA.QRPAConsCOD_RPA.Value;
      DBEdit15Exit(Self);
    end;
  end;
end;

procedure TFEstadiaCad.BtFreteConhecimentoClick(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
   Begin
     if FConhecimentoFreteCons = nil then
       FConhecimentoFreteCons := TFConhecimentoFreteCons.Create(Application);
     if FConhecimentoFreteCons.ShowModal = mrOk then
     begin
       DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Value := DMConhecimentoFrete.QConhecimentoFreteConsCOD_CONHECIMENTO_FRETE.Value;
       DBEdit16Exit(Self);
     end;
   End
  Else
   Begin
     if FConhecimentoCons = nil then
        FConhecimentoCons:= TFConhecimentoCons.Create(Application);
     if FConhecimentoCons.ShowModal = mrOk then
      begin
        DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Value := DMConhecimento.QConhecimentoConsCOD_CONHECIMENTO.Value;
        DBEdit16Exit(Self);
      End;
   End;
end;

procedure TFEstadiaCad.DBEdit15Exit(Sender: TObject);
Var wPeso,wCodNota : String;
begin
  inherited;
  if DMConhecimento.QEstadiaCOD_RPA.Text <> '' then
  begin
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_RPA','COD_RPA = '+DMConhecimento.QEstadiaCOD_RPA.Text) = '2' then
    begin
      DMConhecimento.QEstadiaCOD_FILIAL.Text := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_RPA','COD_RPA = '+DMConhecimento.QEstadiaCOD_RPA.Text);
      DMConhecimento.QEstadiaCOD_CADASTRO.Text := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_RPA','COD_RPA = '+DMConhecimento.QEstadiaCOD_RPA.Text);
      wCodNota := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_RPA','COD_RPA = '+DMConhecimento.QEstadiaCOD_RPA.Text);
      If wCodNota <> '' Then
         wPeso := DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB  = '+wCodNota);
      If wPeso <> '' Then
         DMConhecimento.QEstadiaQT_PESO_SAIDA.Value := StrToFloat(wPeso);
      DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Text:='';
      DBEdit5.SetFocus;
    end
    else
    begin
      DBEdit15.Clear;
      DBEdit15.SetFocus;
      Raise Exception.Create('RPA não confirmada');
    end;
    DMRPA.QRPA.Close;
  end
  else if DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Text = '' then
  begin
    DMConhecimento.QEstadiaCOD_FILIAL.Text := '';
    DMConhecimento.QEstadiaCOD_CADASTRO.Text := '';
    DMConhecimento.QEstadiaQT_PESO_SAIDA.Text := '';
  end;
end;

procedure TFEstadiaCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  MeNumero.Clear;
  if DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Text <> '' then
  begin
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
     Begin
       DMConhecimentoFrete.QConhecimentoFrete.Close;
       DMConhecimentoFrete.QConhecimentoFrete.SetVariable('PK',DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Value);
       DMConhecimentoFrete.QConhecimentoFrete.Open;
       if DMConhecimentoFrete.QConhecimentoFreteIND_SITUACAO.Value = '2' then
        begin
         DMConhecimento.QEstadiaCOD_FILIAL.Value := DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.value;
         DMConhecimento.QEstadiaCOD_CADASTRO.Value := DMConhecimentoFrete.QConhecimentoFreteCOD_CADASTRO.value;
         DMConhecimento.QEstadiaQT_PESO_SAIDA.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB  = '+IntToStr(DMConhecimentoFrete.QConhecimentoFreteCOD_NOTA_CAB.value)));
         //DMConhecimentoFrete.QConhecimentoFreteQT_PESO_FRETE.value;
         MeNumero.Text := DMConhecimentoFrete.QConhecimentoFreteNum_Frete.Text;
         DMConhecimento.QEstadiaCOD_RPA.Text:='';
         DBEdit5.SetFocus;
        end
       else
        begin
         DBEdit16.Clear;
         DBEdit16.SetFocus;
         Raise Exception.Create('Conhecimento frete não Confirmado');
        end;
       DMConhecimentoFrete.QConhecimentoFrete.Close;
     end
    Else
     Begin
       DMConhecimento.QConhecimentoCad.Close;
       DMConhecimento.QConhecimentoCad.SetVariable('PK',DMConhecimento.QEstadiaCOD_CONHECIMENTO_FRETE.Value);
       DMConhecimento.QConhecimentoCad.Open;
       if DMConhecimento.QConhecimentoCadIND_SITUACAO.Value = '2' then
        begin
         DMConhecimento.QEstadiaCOD_FILIAL.Value := DMConhecimento.QConhecimentoCadCOD_FILIAL.value;
         DMConhecimento.QEstadiaCOD_CADASTRO.Value := DMConhecimento.QConhecimentoCadCOD_CADASTRO.value;
         DMConhecimento.QEstadiaQT_PESO_SAIDA.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB  = '+IntToStr(DMConhecimento.QConhecimentoCadCOD_NOTA_CAB.value)));
         MeNumero.Text := DMConhecimento.QConhecimentoCadNum_Conhecimento.Text;
         //DMConhecimentoFrete.QConhecimentoFreteQT_PESO_FRETE.value;
         DMConhecimento.QEstadiaCOD_RPA.Text:='';
         DBEdit5.SetFocus;
        end
       else
        begin
         DBEdit16.Clear;
         DBEdit16.SetFocus;
         Raise Exception.Create('Conhecimento frete não Confirmado');
        end;
       DMConhecimento.QConhecimentoCad.Close;
     end
   end
  else
   if DMConhecimento.QEstadiaCOD_RPA.Text = '' then
    begin
      DMConhecimento.QEstadiaCOD_FILIAL.Text := '';
      DMConhecimento.QEstadiaCOD_CADASTRO.Text := '';
      DMConhecimento.QEstadiaQT_PESO_SAIDA.Text := '';
    end;
end;

procedure TFEstadiaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimento.QEstadia.open;
end;

procedure TFEstadiaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimento.QEstadia.Close;
end;

procedure TFEstadiaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEstadiaCons = nil then
    FEstadiaCons := TFEstadiaCons.Create(application);
  if FEstadiaCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QEstadia.Close;
      QEstadia.SetVariable('PK',QEstadiaConsCOD_ESTADIA.Value);
      QEstadia.Open;
    end;
  end;
end;

procedure TFEstadiaCad.SBConfirmarClick(Sender: TObject);
Var wCont : String;
begin
  If DsPrimario.State in [DsInsert] Then
  Begin
    If (DBEdit16.Text) <> '' Then
     Begin
       wCont := DMOracle.BuscaNome('SELECT count(*) FROM TB_ESTADIA','COD_CONHECIMENTO_FRETE = '+Trim(DBEdit16.Text));
       If wCont <> '' then
          If StrToInt(wCont) = 1 Then
             Raise Exception.Create('Conhecimento de frete ja utilizado em outra estadia');
     End;
    If (DBEdit15.Text) <> '' Then
     Begin
       wCont := DMOracle.BuscaNome('SELECT count(*) FROM TB_ESTADIA','COD_RPA = '+Trim(DBEdit15.Text));
       If wCont <> '' then
          If StrToInt(wCont) = 1 Then
             Raise Exception.Create('RPA já utilizado em outra estadia');
     End;
  End;  
  inherited;
  DSPrimarioStateChange(Self);
end;

procedure TFEstadiaCad.RelaoEstadias1Click(Sender: TObject);
begin
  inherited;
  if FEstadiaParam = Nil then
    FEstadiaParam:= TFEstadiaParam.Create(Application);
  FEstadiaParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FEstadiaParam.ShowModal =  mrOk then
  begin
    with DMConhecimento do
    begin
      QREstadia.Close;
      if Trim(FEstadiaParam.ME1DtInicio.Text) = '/  /' then
        Raise Exception.Create('Data inicio deve ser Informada')
      else
        QREstadia.SetVariable('DT_INICIAL', StrToDate(Trim(FEstadiaParam.ME1DtInicio.Text)));

      if Trim(FEstadiaParam.ME1DtFim.Text) = '/  /'then
        FEstadiaParam.ME1DtFim.Text := DateToStr(Date);
      QREstadia.SetVariable('DT_FINAL',StrToDate(Trim(FEstadiaParam.ME1DtFim.Text)));

      if Trim(FEstadiaParam.ME1Filial.Text) = '' then
        QREstadia.SetVariable('COD_FILIAL',NULL)
      else
        QREstadia.SetVariable('COD_FILIAL',StrToInt(Trim(FEstadiaParam.ME1Filial.Text)));

      if Trim(FEstadiaParam.ME1Cadastro.Text) = '' then
        QREstadia.SetVariable('COD_CADASTRO', NULL)
      else
        QREstadia.SetVariable('COD_CADASTRO',StrToInt(Trim(FEstadiaParam.ME1Cadastro.Text)));

      if Trim(FEstadiaParam.ME1Estadia.Text) = '' then
        QREstadia.SetVariable('COD_ESTADIA', NULL)
      else
        QREstadia.SetVariable('COD_ESTADIA',StrToInt(Trim(FEstadiaParam.ME1Estadia.Text)));

      if FEstadiaParam.RG1Situacao.ItemIndex = 1 then
        QREstadia.SetVariable('IND_SITUACAO', 'DIGITADA')
      else if FEstadiaParam.RG1Situacao.ItemIndex = 2 then
        QREstadia.SetVariable('IND_SITUACAO', 'CONFIRMADA')
      else
        QREstadia.SetVariable('IND_SITUACAO', NULL);

      QREstadia.Open;

      if FRelacaoEstadia = nil then
        FRelacaoEstadia := TFRelacaoEstadia.Create(application);

      FRelacaoEstadia.QRLPeriodo.Caption := 'Período entre '+FEstadiaParam.ME1DtInicio.Text+' até '+FEstadiaParam.ME1DtFim.Text;
      FRelacaoEstadia.QRLFilial.Caption := 'Filial: '+FEstadiaParam.ED1Filial.Text;

      if FEstadiaParam.ED1Filial.Text <> 'Todas' then
        FRelacaoEstadia.QRLEmpresa.Caption := FEstadiaParam.ED1Filial.Text
      else
        FRelacaoEstadia.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Value;

      if FEstadiaParam.RGPreview.ItemIndex = 0 then
        FRelacaoEstadia.QRPrimario.Preview
      else
        FRelacaoEstadia.QRPrimario.Print;

      QREstadia.Close;
    end;
  end;
end;

procedure TFEstadiaCad.ConfirmarEstadia1Click(Sender: TObject);
var
  wContaDeb,wNumDoc,wContaCred,wHistContabil :String;
  wCodDoc,wCodCompl,wVlrLancto,wCodHistorico :Real;
  wFilial :Integer;
  wDtLancto :TDateTime;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QEstadiaCOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimento.QEstadiaDt_Emissao.Value then
     raise Exception.Create('Não é Permitido Confirmar esta Estadia - Fechamento Contabil');
  DMConhecimento.QEstadia.CommitOnPost:=false;

  //gera conta a pagar
  try
    with DMConhecimento do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QEstadia.Edit;
      if FEstadia_CP = nil then
        FEstadia_CP := TFEstadia_CP.Create(Application);
      FEstadia_CP.BtCancelar.Visible := False;
      if FEstadia_CP.ShowModal = mrOk then
      begin
        if trim(FEstadia_CP.MECodFinalidade.Text) = '' then
          raise exception.create('É necessário informar uma finalidade.');
        if trim(FEstadia_CP.MECodDepartamento.Text) = '' then
          raise exception.create('É necessário informar um Departamento.');
        if trim(FEstadia_CP.MEDt_Vencimento.Text) = '' then
          raise exception.create('É necessário informar um Vencimento.');
        with DMContasPagar do
        begin
          QContasPagar_Mov.Close;
          QContasPagar_cab.Close;
          QContasPagar_cab.Open;
          QContasPagar_Mov.Open;
          QContasPagar_Cab.Insert;
          if Trim(FEstadia_CP.MECodFinalidade.Text)<>'' then
            QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(FEstadia_CP.MECodFinalidade.text));
          if Trim(FEstadia_CP.MECodBanco.Text)<>'' then
            QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(FEstadia_CP.MECodBanco.text));
          if Trim(FEstadia_CP.MECodDepartamento.Text)<>'' then
            QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(FEstadia_CP.MECodDepartamento.text));
          QContasPagar_CabCod_Cadastro.Value:=QEstadiaCod_Cadastro.Value;
          QContasPagar_CabCod_Filial.Value:=QEstadiaCod_Filial.Value;
          QContasPagar_CabCod_Estadia.Value:=QEstadiaCod_Estadia.Value;
          QContasPagar_CabDesc_tipo_Documento.Value:='ESTADIA';
          QContasPagar_CabDT_EMISSAO.Value:=QEstadiaDT_EMISSAO.value;
          QContasPagar_CabDT_VENCIMENTO.Text:=trim(FEstadia_CP.MEDt_Vencimento.Text);
          QContasPagar_CabVAL_TITULO.Value:=QEstadiaVAL_PAGO.Value;
          QContasPagar_CabNUM_TITULO.Value:=QEstadiaNum_Estadia.Value;
          QContasPagar_CabIND_ACEITE.Value:='NAO';
          QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
          QContasPagar_CabDESC_OBSERVACAO.Value:='Referente a Estadia nr.'+QEstadiaNum_Estadia.Text;
          QCOntasPagar_Cab.Post;
          QContasPagar_Mov.Close;
          QEstadiaCod_Conta_Pagar_Cab.Value := QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
        end;
      end;
      //gera lançamentos contábeis
      If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
      Begin
        If(DMConhecimento.QEstadiaVAL_PAGO.Value > 0)Then
        begin
          wFilial:=QEstadiaCod_Filial.Value;
          wCodDoc:=DMConhecimento.QEstadiaCOD_ESTADIA.Value;
          wNumDoc:=FloatToStr(DMConhecimento.QEstadiaNum_Estadia.Value)+' - '+Trim(DMConhecimento.QEstadiaDESC_CADASTRO.Value);
          wFilial:=wFilial;
          wCodCompl:=DMConhecimento.QEstadiaCod_Cadastro.Value;
          wVlrLancto:=DMConhecimento.QEstadiaVAL_PAGO.Value;
          wDtLancto:=DMConhecimento.QEstadiaDt_Emissao.Value;
          wContaDeb:=Trim(DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE','COD_FINALIDADE = '+Trim(FEstadia_CP.MECodFinalidade.Text)));
          wContaCred:=Trim(DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE','COD_FINALIDADE = '+Trim(FEstadia_CP.MECodFinalidade.Text)));
          if(wContaDeb = '') or (wContaCred = '') then
            raise exception.create('Confira as contas de debito e credito na Finalidade');
          wHistContabil:=Trim(DMOracle.BuscaNome('SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE ','COD_FINALIDADE = '+Trim(FEstadia_CP.MECodFinalidade.Text)));
          if wHistContabil <> '' then
            wCodHistorico:=StrToFloat(wHistContabil)
          else
             raise exception.create('Confira o Cod. do Histório contábil na Finalidade');
          wDtLancto:=QEstadiaDt_Emissao.Value;
          DMPlanilha.GravaLanc('EST',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaDeb);
          DMPlanilha.GravaLanc('EST',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaCred);
        end;
      end;
      DMConhecimento.QEstadiaInd_Situacao.Value:='CONFIRMADA';
      DMConhecimento.QEstadia.Post;
      DMOracle.DBCemapa.Commit;
  end;
  except
    DMOracle.DBCemapa.Rollback;
    DMConhecimento.QEstadia.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMContasPagar.QContasPagar_cab.Cancel;
    DMConhecimento.QEstadia.CommitOnPost:=true;
    DMPlanilha.QLcto1.Cancel;
    Raise;
  end;
  DMConhecimento.QEstadia.CommitOnPost:=true;
end;

procedure TFEstadiaCad.CancelarEstadia1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimento.QEstadiaCOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimento.QEstadiaDt_Emissao.Value then
     raise Exception.Create('Não é Permitido Cancelar esta Estadia - Fechamento Contabil');
  if DMConhecimento.QEstadiaInd_Situacao.Value = 'DIGITADA' then
  begin
    DMConhecimento.QEstadia.Edit;
    DMConhecimento.QEstadiaInd_Situacao.Value := 'CANCELADA';
    DMConhecimento.QEstadia.Post;
    DMOracle.DBCemapa.Commit;
  end
  else
    Raise Exception.Create('Somente Cancelar Estadias Digitadas');
end;

procedure TFEstadiaCad.VoltarConfirmao1Click(Sender: TObject);
var
  wConta_Pagar_Cab,wComando: String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimento.QEstadiaCOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimento.QEstadiaDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Voltar Confirmação Desta Estadia - Fechamento Contabil');
  if DMConhecimento.QEstadiaNum_Estadia.Value <> 0 then
  begin
    DMConhecimento.QEstadia.CommitOnPost:=false;
    DMOracle.DBCemapa.StartTransaction;
    try
      with DMConhecimento do
      begin
        QEstadia_CP.Close;
        QEstadia_CP.SetVariable('COD_ESTADIA',QEstadiaCOD_ESTADIA.Value);
        QEstadia_CP.Open;
        while not (QEstadia_CP.Eof) do //enquanto tiver conta pagar mov
        begin
          wConta_Pagar_Cab:= DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_MOV',
                                                'IND_TIPO_MOVIMENTO <> '+ Chr(39) + 'PRINCIPAL' + Chr(39) +
                                                ' AND COD_CONTA_PAGAR_CAB = '+QEstadia_CPCod_Conta_Pagar_cab.Text);
          if wConta_Pagar_Cab <> '' then
            Raise Exception.Create ('Contas a Pagar Com Movimentação - Baixas');
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'DELETE FROM TB_CONTA_PAGAR_MOV';
            wComando := wComando + ' WHERE COD_CONTA_PAGAR_CAB = '+QEstadia_CPCod_Conta_Pagar_cab.Text;
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
          QEstadia_CP.Delete;
        end;
        QEstadia_CP.Close;
        ///DMPlanilha.Descontabiliza(QEstadiaCod_Estadia.Value,'EST');
        //DMOracle.Audit(TOracleDataset1 (DSPrimario.Dataset ), 'Alteração' );
        QEstadia.Edit;
        QEstadiaCOD_CONTA_PAGAR_CAB.Text:='';
        QEstadiaInd_Situacao.Value := 'DIGITADA';
        QEstadia.Post;

        DMPlanilha.Descontabiliza(Trunc(DMConhecimento.QEstadiaCod_Estadia.Value),'EST');
        DMOracle.DBCemapa.Commit;
      end;
    except
       DMOracle.DBCemapa.Rollback;
       DMConhecimento.QEstadia.CommitOnPost:=true;
      Raise;
    end;
  end;
  DMConhecimento.QEstadia.CommitOnPost:=true;
end;

procedure TFEstadiaCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimento.QEstadiaCOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimento.QEstadiaDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Cancelar Esta Estadia - Fechamento Contabil');
  if DMConhecimento.QEstadiaInd_Situacao.Value = 'CANCELADA' then
  begin
    DMConhecimento.QEstadia.Edit;
    DMConhecimento.QEstadiaInd_Situacao.Value := 'DIGITADA';
    DMConhecimento.QEstadia.Post;
    DMOracle.DBCemapa.Commit;
  end
  else
   Raise Exception.Create('Somente Voltar Cancelamento Estadias canceladas');
end;
procedure TFEstadiaCad.SBAlterarClick(Sender: TObject);
begin
  if DMConhecimento.QEstadiaIND_SITUACAO.Value = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível alterar esta estadia - Estadia Confirmada');
  inherited;
end;

procedure TFEstadiaCad.DBEdit1Change(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := DMConhecimento.QEstadiaInd_Situacao.Value = 'DIGITADA';
  MMCadSimples.Items[2].Items[1].Enabled := DMConhecimento.QEstadiaInd_Situacao.Value = 'DIGITADA';
  MMCadSimples.Items[2].Items[2].Enabled := DMConhecimento.QEstadiaInd_Situacao.Value = 'CONFIRMADA';
  MMCadSimples.Items[2].Items[3].Enabled := DMConhecimento.QEstadiaInd_Situacao.Value = 'CANCELADA';
end;

procedure TFEstadiaCad.EspelhoEstadia1Click(Sender: TObject);
begin
  inherited;
  If FrEstadiaEspelho = Nil Then
     FrEstadiaEspelho := TFrEstadiaEspelho.Create(Application);
  If DMConhecimento.QEstadiaCod_Estadia.Text <> '' Then
     FrEstadiaEspelho.QRPrimario.Preview;
end;

end.
