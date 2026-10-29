unit UControleCargaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls,OracleData, OraTeste, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFControleCargaCad = class(TFTCadSimples)
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
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
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
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    SBControleCarga: TSpeedButton;
    SBTransportador: TSpeedButton;
    SBMotorista: TSpeedButton;
    Emitir1: TMenuItem;
    Operaes1: TMenuItem;
    Confirmar2: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    Cancelar2: TMenuItem;
    VoltaCancelamento1: TMenuItem;
    DBEdit20: TDBEdit;
    Label6: TLabel;
    SBFilial: TSpeedButton;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    LBSituacao: TLabel;
    ControledeCarga1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBControleCargaClick(Sender: TObject);
    procedure SBTransportadorClick(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Emitir1Click(Sender: TObject);
    procedure Confirmar2Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBEdit20Change(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure Cancelar2Click(Sender: TObject);
    procedure VoltaCancelamento1Click(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure ControledeCarga1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleCargaCad: TFControleCargaCad;

implementation

uses UControleCarga_cl, UConhecimentoCad, UEmbarqueCons, UEmbarque_cl,
  UCadastroCons, UCadastro_cl, UMotoristaCons, UMotorista_cl,
  UControleCargaCons, URControleCarga, UOracle_cl, UConhecimento_CP,
  UContasPagar_cl, UParamSistema_cl, UFilialCons, UFilial_cl,
  UControleCargaParam, UConhecimentoParam, UControleCargaRel_cl,
  URControleCargaData;

{$R *.DFM}

procedure TFControleCargaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMControleCarga.QControleCargaCad.open;
end;

procedure TFControleCargaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  DMControleCarga.QControleCargaCad.close;
  action:=cafree;
  FControleCargaCad:=nil;
end;

procedure TFControleCargaCad.SBControleCargaClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = nil then
    FEmbarqueCons:=TFEmbarqueCons.create(application);
  if FEmbarqueCons.showmodal = mrOk then
    DMControleCarga.QControleCargaCadCOD_EMBARQUE.value := DMEmbarque.QEmbarqueConsCOD_EMBARQUE.value;
end;

procedure TFControleCargaCad.SBTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMControleCarga.QControleCargaCadCOD_TRANSPORTADOR.value := DMCadastro.QCadastroConsCOD_CADASTRO.value;
end;

procedure TFControleCargaCad.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
     DMControleCarga.QControleCargaCadCOD_MOTORISTA.value := DMCadastro.QCadastroConsCOD_CADASTRO.value;

{
   if FMotoristaCons = nil then
     FMotoristaCons:=TFMotoristaCons.create(application);
   if FMotoristaCons.showmodal = mrOk then
     DMControleCarga.QControleCargaCadCOD_MOTORISTA.value := DMMotorista.QMotoristaConsCOD_MOTORISTA.value;
}
end;

procedure TFControleCargaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
  begin
    SBControleCarga.Enabled := true;
    SBTransportador.Enabled := true;
    SBMotorista.Enabled := true;
    SBFilial.Enabled := true;
  end
  else
  begin
    SBControleCarga.Enabled := false;
    SBTransportador.Enabled := false;
    SBMotorista.Enabled := false;
    SBFilial.Enabled := false;
  end;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
end;

procedure TFControleCargaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FControleCargaCons = nil then
    FControleCargaCons := TFControleCargaCons.Create(Application);
  if FControleCargaCons.ShowModal = mrOk then
   begin
     with DMControleCarga do
      begin
        QControleCargaCad.Close;
        QControleCargaCad.SetVariable('PK',QControleCargaConsCOD_CONTROLE_CARGA.Value);
        QControleCargaCad.Open;
      end;
   end;
End;

procedure TFControleCargaCad.Emitir1Click(Sender: TObject);
begin
  inherited;
  If FRControleCarga = nil then
    FRControleCarga := TFRControleCarga.create(application);
  FRControleCarga.QRPrimario.Preview;
End;

procedure TFControleCargaCad.Confirmar2Click(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.StartTransaction;
  Try
    With DMControleCarga Do
    begin
      If FConhecimento_CP = Nil then
         FConhecimento_CP := TFConhecimento_CP.Create(Application);
      FConhecimento_CP.BitBtn1.Visible := False;
      If FConhecimento_CP.ShowModal = MrOk Then
       Begin
         With DMContasPagar do
         Begin
            QContasPagar_Mov.Close;
            QContasPagar_cab.Close;
            QContasPagar_cab.Open;
            QContasPagar_Mov.Open;
            QContasPagar_Cab.Insert;
            if Trim(FConhecimento_CP.MECodFinalidade.Text)<>'' then
              QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(FConhecimento_CP.MECodFinalidade.text));
            if Trim(FConhecimento_CP.MECodBanco.Text)<>'' then
              QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(FConhecimento_CP.MECodBanco.text));
            if Trim(FConhecimento_CP.MECodDepartamento.Text)<>'' then
              QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text));
            QContasPagar_CabCod_Cadastro.Value:= QControleCargaCadCod_Transportador.Value;
            QContasPagar_CabCod_Filial.Value:=QControleCargaCadCod_Filial.Value;
            QContasPagar_CabDesc_tipo_Documento.Value:='FRE';
            QContasPagar_CabDT_EMISSAO.Value:=QControleCargaCadDT_SAIDA.value;
            QContasPagar_CabDT_VENCIMENTO.Value:=QControleCargaCadDT_Vencimento.value;
            QContasPagar_CabVAL_TITULO.Value:=QControleCargaCadSaldo_Pagar.Value;
            QContasPagar_CabNUM_TITULO.Value:=QControleCargaCadCod_Controle_Carga.Value;
            QContasPagar_CabIND_ACEITE.Value:='NAO';
            QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
            QCOntasPagar_Cab.Post;
            QControleCargaCad.Edit;
            QControleCargaCadCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
            QControleCargaCadInd_Situacao.Value := '2';
            QControleCargaCad.Post;
            QContasPagar_Mov.Close;
            QContasPagar_cab.Close;
         End;
       End;
       DMOracle.DBCemapa.Commit;
    End;
   Except
     DMControleCarga.QControleCargaCad.Cancel;
     DMContasPagar.QContasPagar_Cab.Cancel;
     DMContasPagar.QContasPagar_Mov.Cancel;
     DMOracle.DBCemapa.Rollback;
     Raise Exception.Create('Não foi possivel Confirmar Controle de Carga!');
   End;
End;

procedure TFControleCargaCad.SBExcluirClick(Sender: TObject);
Begin
  If DMControleCarga.QControleCargaCadInd_Situacao.Value <> '1' Then
     Raise Exception.Create('Somente Excluir Controle Carga Digitados')
  Else
     inherited;
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DBCemapa.Commit;
End;

procedure TFControleCargaCad.DBEdit20Change(Sender: TObject);
begin
  inherited;
  With DMControleCarga do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QControleCargaCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QControleCargaCadInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[2].Enabled := QControleCargaCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[3].Enabled := QControleCargaCadInd_Situacao.Value = '3';

    LBSituacao.Visible := (QControleCargaCadInd_Situacao.Value = '2') or
                          (QControleCargaCadInd_Situacao.Value = '3'); //SE ESTÁ CONFIRMADO OU CANCELADO MOSTRA
    if QControleCargaCadInd_Situacao.Value = '2' then
       LBSituacao.Caption := 'CONFIRMADO';
    if QControleCargaCadInd_Situacao.Value = '3' then
       LBSituacao.Caption := 'CANCELADO';
  End;
End;

procedure TFControleCargaCad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMControleCarga.QControleCargaCadCod_Controle_Carga.Value <> 0 then
   begin
     if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMControleCarga.QControleCargaCadDt_Saida.Value Then
        raise Exception.Create('Não é Permitido Voltar Este Controle Carga - Fechamento Contabil');
     DMOracle.DBCemapa.StartTransaction;
     Try
       with DMContasPagar do
        begin
          QContasPagar_Cab.Close;
          QContasPagar_Mov.Close;
          QContasPagar_Cab.SetVariable('Pk',DMControleCarga.QControleCargaCadCod_Conta_Pagar_Cab.Value);
          QContasPagar_Cab.Open;
          QContasPagar_Mov.Open;
          DMControleCarga.QControleCargaCad.Edit;
          DMControleCarga.QControleCargaCadInd_Situacao.Value := '1';
          DMControleCarga.QControleCargaCadCod_Conta_Pagar_Cab.Text := '';
          DMControleCarga.QControleCargaCad.Post;
          While not QContasPagar_Cab.Eof do
           Begin
             If (QContasPagar_MovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                Raise Exception.Create('Conta a Pagar com baixas!')
             Else
                QContasPagar_Mov.Delete;
             QContasPagar_Cab.Delete;
           End;
        end;
       DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Volta Confirmação' );
       DMOracle.DBCemapa.Commit;
     Except
        DMOracle.DBCemapa.Rollback;
        DMContasPagar.QContasPagar_Cab.Close;
        DMContasPagar.QContasPagar_Mov.Close;
        DMControleCarga.QControleCargaCad.Close;
        DMControleCarga.QControleCargaCad.Open;
        Raise;
     End;
  end;
end;

procedure TFControleCargaCad.Cancelar2Click(Sender: TObject);
begin
  inherited;
  If DMControleCarga.QControleCargaCadInd_Situacao.Value <> '1' Then
    Raise Exception.Create('Não é possível cancelar este controle carga!');
  With DMControleCarga do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QControleCargaCad.Edit;
      QControleCargaCadInd_Situacao.Value := '3';
      QControleCargaCad.Post;
      DMOracle.DBCemapa.Commit;
    Except
      DMOracle.DBCemapa.Rollback;
      If QControleCargaCad.State <> dsBrowse then
        QControleCargaCad.Cancel;
      Raise Exception.Create('Não é possível cancelar este Controle de Carga!');
    End;
  End;
end;

procedure TFControleCargaCad.VoltaCancelamento1Click(Sender: TObject);
begin
  inherited;
  If DMControleCarga.QControleCargaCadInd_Situacao.Value <> '3' Then
    Raise Exception.Create('Não é possível voltar cancelamento deste controle carga!');
  With DMControleCarga do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QControleCargaCad.Edit;
      QControleCargaCadInd_Situacao.Value := '1';
      QControleCargaCad.Post;
      DMOracle.DBCemapa.Commit;
    Except
      DMOracle.DBCemapa.Rollback;
      If QControleCargaCad.State <> dsBrowse then
        QControleCargaCad.Cancel;
      Raise Exception.Create('Não é possível cancelar este Controle de Carga!');
    End;
  End;

end;

procedure TFControleCargaCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMControleCarga.QControleCargaCadCOD_FILIAL.value := DMFilial.QFilialConsCOD_FILIAL.value;
end;

procedure TFControleCargaCad.SBAlterarClick(Sender: TObject);
begin
  If DMControleCarga.QControleCargaCadInd_Situacao.Value <> '1' Then
     Raise Exception.Create ('Não é permitido alterar Carga confirmada ou cancelada');
  inherited;
end;

procedure TFControleCargaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DBCemapa.Commit;

end;

procedure TFControleCargaCad.ControledeCarga1Click(Sender: TObject);
begin
  inherited;
  if FControleCargaParam = Nil then
    FControleCargaParam := TFControleCargaParam.Create(Application);
  FControleCargaParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FControleCargaParam.ShowModal =  mrOk then
  begin
    with DMControleCargaRel do
    begin
      QRControleCarga.Close;
      If(Trim(FControleCargaParam.ME0Data_I.Text) <> '')Then
        QRControleCarga.SetVariable('DT_SAIDA_I', FControleCargaParam.ME0Data_I.Text);

      If(Trim(FControleCargaParam.ME0Data_I.Text) <> '')Then
        QRControleCarga.SetVariable('DT_SAIDA_F', FControleCargaParam.ME0Data_F.Text);

      if Trim(FControleCargaParam.ME0Motorista.Text) = '' then
        QRControleCarga.SetVariable('COD_MOTORISTA',NULL)
      else
        QRControleCarga.SetVariable('COD_MOTORISTA',StrToInt(Trim(FControleCargaParam.ME0Motorista.Text)));

      if Trim(FControleCargaParam.ME0Destino.Text) = '' then
        QRControleCarga.SetVariable('DESTINO',NULL)
      else
        QRControleCarga.SetVariable('DESTINO',Trim(FControleCargaParam.ME0Destino.Text));

      QRControleCarga.Open;

      If(FRControleCargaData = nil)Then
        FRControleCargaData := TFRControleCargaData.Create(Application);
      FRControleCargaData.QRLbPeriodo.Caption  := 'Período entre ' + FControleCargaParam.Me0Data_i.Text +
                                                  ' até '          + FControleCargaParam.Me0Data_f.Text;

      FRControleCargaData.QRLMotorista.Caption := 'Motorista: ' + FControleCargaParam.ED0Motorista.Text;
      FRControleCargaData.QRLDestino.Caption   := 'Destino: '   + FControleCargaParam.ME0Destino.Text;

      If FControleCargaParam.RGPreview.ItemIndex = 0 then
        FRControleCargaData.QRPrimario.Preview
      else
        FRControleCargaData.QRPrimario.Print;
      QRControleCarga.Close;
    end;
  end;
end;

end.
