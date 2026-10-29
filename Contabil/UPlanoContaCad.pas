unit UPlanoContaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPlanoContaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBECodFilial: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BtFilial: TBitBtn;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Opes1: TMenuItem;
    DuplicaPlanodeContas1: TMenuItem;
    PlanodeContas1: TMenuItem;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    BtGrupo: TBitBtn;
    BtDepartamento: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBRadioGroup2: TDBRadioGroup;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtPlanoContaReferencial: TBitBtn;
    DBDirceu3: TDBDirceu;
    DBRadioGroup3: TDBRadioGroup;
    DFC1: TMenuItem;
    GroupBox1: TGroupBox;
    DBCBOperacional: TDBCheckBox;
    DBCBInvestimento: TDBCheckBox;
    DBCBFinanciamento: TDBCheckBox;
    DBRadioGroup4: TDBRadioGroup;
    procedure BtFilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DuplicaPlanodeContas1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtGrupoClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure BtPlanoContaReferencialClick(Sender: TObject);
    procedure DFC1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaCad: TFPlanoContaCad;

implementation

uses UPlanoConta_cl, UFilialCons, UFilial_cl, UParamSistema_cl,
  UPlanoContaCons, UPlanoContasParam, UPlanilha_cl, URPlanoContas,
  UFGrupo_CustosCons, UDepartamentoCons, UDepartamento_cl,
  UGrupo_cl, UUsuario_cl, UPlanoContaReferencial_cl,
  UPlanoContaReferencialCons, URDfc, UOracle_cl, UFmFilial;

{$R *.DFM}

procedure TFPlanoContaCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;


procedure TFPlanoContaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: QPlanoContaNum_Plano_Conta.EditMask := '#.##.##.######;0;';
       5: QPlanoContaNum_Plano_Conta.EditMask := '#.##.##.##.######;0;';
       6: QPlanoContaNum_Plano_Conta.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
  DSPrimario.AutoEdit:=False;
end;

procedure TFPlanoContaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContacons.ShowModal = mrOk then
  With DMPlanoConta do
  Begin
    QPlanoConta.Close;
    QPlanoConta.SetVariable('PK',QPlanoContaConsCod_Plano_Conta.Value);
    QPlanoConta.Open;
  End;
end;

procedure TFPlanoContaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMPlanoConta.QPlanoContaCod_Filial.Value:=DMParamSistema.QParamSistemaCOD_FILIAL.Value;
  If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
    begin
      DBECodFilial.Enabled:=False;
      BtFilial.Enabled:=False;
    end
  Else
    begin
      DBECodFilial.Enabled:=True;
      BtFilial.Enabled:=True;
    end;
  DMPlanoConta.QPlanoContaDESC_NATUREZA_CONTA.Value := '01';

  // Libera o usuário da Dani para cadastrar contas contábeis na Grasel.
  // Por ser plano UNICO estava cadastrando todas as contas na filial 1
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL')
    and (DMUsuario.CodUsuarioCorrente = 3) then
  begin
    DBECodFilial.Enabled := true;
    BtFilial.Enabled := true;
  end;

end;

procedure TFPlanoContaCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
    begin
      DBECodFilial.Enabled:=False;
      BtFilial.Enabled:=False;
    end
  Else
    begin
      DBECodFilial.Enabled:=True;
      BtFilial.Enabled:=True;
    end;
end;

procedure TFPlanoContaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] then
   Begin
    BtFilial.Enabled:=True;
    BtGrupo.Enabled:=True;
    BtDepartamento.Enabled:=True;
    BtPlanoContaReferencial.Enabled := true;
   End
  Else
   Begin
    BtFilial.Enabled:=False;
    BtGrupo.Enabled:=False;
    BtDepartamento.Enabled:=False;
    BtPlanoContaReferencial.Enabled := False;
   End;  
end;

procedure TFPlanoContaCad.DuplicaPlanodeContas1Click(Sender: TObject);
begin
  inherited;
  if FPlanoContasParam = Nil then
    FPlanoContasParam:=TFPlanoContasParam.Create(Application);
  FPlanoContasParam.PGRelatorio.Pages[0].TabVisible:=True;
  FPlanoContasParam.RGPreview.Visible:=false;
  if FPlanoContasParam.ShowModal = mrOK  then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FPlanoContasParam.ME0CodFilialInicial.Text),'CONTABIL');
      DmUsuario.Checar_Filial_Usuario( Trim(FPlanoContasParam.ME0CodFilialFinal.Text),'CONTABIL');
      with DMPlanoConta do
        begin
          QDuplicaPlanoConta.Close;
          if Trim(FPlanoContasParam.ME0CodFilialInicial.Text)<>'' then
            QDuplicaPlanoConta.SetVariable('COD_FILIAL_MODELO',StrToInt(Trim(FPlanoContasParam.ME0CodFilialInicial.Text)))
          else
            QDuplicaPlanoConta.SetVariable('COD_FILIAL_MODELO',Null);

          if Trim(FPlanoContasParam.ME0CodFilialFinal.Text)<>'' then
            QDuplicaPlanoConta.SetVariable('COD_FILIAL_NOVA',StrToInt(Trim(FPlanoContasParam.ME0CodFilialFinal.Text)))
          else
            QDuplicaPlanoConta.SetVariable('COD_FILIAL_NOVA',Null);

          if Trim(FPlanoContasParam.ME0CodContaInicial.Text)<>'' then
            QDuplicaPlanoConta.SetVariable('NUM_PLANO_CONTA_INICIAL',Trim(FPlanoContasParam.ME0CodContaInicial.Text))
          else
            QDuplicaPlanoConta.SetVariable('NUM_PLANO_CONTA_INICIAL',Null);

          if Trim(FPlanoContasParam.ME0CodContaFinal.Text)<>'' then
            QDuplicaPlanoConta.SetVariable('NUM_PLANO_CONTA_FINAL',Trim(FPlanoContasParam.ME0CodContaFinal.Text))
          else
            QDuplicaPlanoConta.SetVariable('NUM_PLANO_CONTA_FINAL',Null);
          QDuplicaPlanoConta.ExecSql;
        end;
    end;
    FPlanoContasParam.RGPreview.Visible:=True;
    FPlanoContasParam.Release;
    FPlanoContasParam:=Nil;
end;

procedure TFPlanoContaCad.PlanodeContas1Click(Sender: TObject);
begin
  inherited;
  if FPlanoContasParam = Nil then
    FPlanoContasParam:=TFPlanoContasParam.Create(Application);
  FPlanoContasParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FPlanoContasParam.ShowModal = mrOK  then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FPlanoContasParam.ME1CodFilialInicial.Text),'CONTABIL');
      DmUsuario.Checar_Filial_Usuario( Trim(FPlanoContasParam.ME1CodFilialFinal.Text),'CONTABIL');
      with DMPlanoConta do
        begin
          If FRPlanoContas= Nil then
             FRPlanoContas:=TFRPlanoContas.Create(Application);
          QRPlanoContas.Close;
          if Trim(FPlanoContasParam.ME1CodFilialInicial.Text)<>'' then
           Begin
             FRPlanoContas.QRLFilial.Caption := 'Filial: '+FPlanoContasParam.Me1FilialInicial.Text;
             QRPlanoContas.SetVariable('COD_FILIAL_INICIAL',StrtoInt(Trim(FPlanoContasParam.ME1CodFilialInicial.Text)));
           End
          else
           Begin
             FRPlanoContas.QRLFilial.Caption := 'Filial: Todas';
             QRPlanoContas.SetVariable('COD_FILIAL_INICIAL',Null);
           End;
          if Trim(FPlanoContasParam.ME1CodFilialFinal.Text)<>'' then
            QRPlanoContas.SetVariable('COD_FILIAL_FINAL',StrToInt(Trim(FPlanoContasParam.ME1CodFilialFinal.Text)))
          else
            QRPlanoContas.SetVariable('COD_FILIAL_FINAL',Null);
          if Trim(FPlanoContasParam.ME1CodContaInicial.Text)<>'' then
            QRPlanoContas.SetVariable('NUM_PLANO_CONTA_INICIAL',Trim(FPlanoContasParam.ME1CodContaInicial.Text))
          else
            QRPlanoContas.SetVariable('NUM_PLANO_CONTA_INICIAL',Null);
          if Trim(FPlanoContasParam.ME1CodContaFinal.Text)<>'' then
            QRPlanoContas.SetVariable('NUM_PLANO_CONTA_FINAL',Trim(FPlanoContasParam.ME1CodContaFinal.Text))
          else
            QRPlanoContas.SetVariable('NUM_PLANO_CONTA_FINAL',Null);
          If FPlanoContasParam.Rg1Situacao.ItemIndex = 0 Then
             QRPlanoContas.SetVariable('IND_LIBERADO_USO','SIM')
          Else
             QRPlanoContas.SetVariable('IND_LIBERADO_USO',Null);
          QRPlanoContas.SetVariable('NUM_GRAU',FPlanoContasParam.Rg1Grau.ItemIndex+1);
          QRPlanoContas.Open;
        end;
      FRPlanoContas.Pag_Inicial:=StrToInt(Trim(FPlanoContasParam.ME1Pagina.text))-1;
      FRPlanoContas.Pag_Inicial_Param:=StrToInt(Trim(FPlanoContasParam.ME1Pagina.text))-1;

      If FPlanoContasParam.RGPreview.ItemIndex=0 then
        FRPlanoContas.QRPrimario.Preview
      else
        FRPlanoContas.QRPrimario.Print;
      DMPlanoConta.QRPlanoContas.Close;
    end;
end;

procedure TFPlanoContaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(3);
end;

procedure TFPlanoContaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMPlanoConta do
    QPlanoConta.Close;
  Action := CaFree;
  FPlanoContaCad := Nil;
end;

procedure TFPlanoContaCad.BtGrupoClick(Sender: TObject);
begin
  inherited;
  If FGrupo_CustosCons = Nil then
    FGrupo_CustosCons := TFGrupo_CustosCons.Create(Application);
  If FGrupo_CustosCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaCod_Grupo.Value := DMGrupo.QGrupo_CustoConsCod_Grupo.Value;

end;

procedure TFPlanoContaCad.BtDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFPlanoContaCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMPlanoConta.QPlanoContaCOD_FILIAL.Text),'CONTABIL');
  inherited;
end;

procedure TFPlanoContaCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  DMPlanoConta.QPlanoContaCod_Reduzido.Clear;

end;

procedure TFPlanoContaCad.BtPlanoContaReferencialClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaReferencialCons = Nil then
    FPlanoContaReferencialCons := TFPlanoContaReferencialCons.Create(Application);
  If FPlanoContaReferencialCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaCOD_PLANO_CONTA_REFERENCIAL.Value := DmPlanoContaReferencial.QPlanoContaReferencialConsCOD_PLANO_CONTA_REFERENCIAL.Value;
end;

procedure TFPlanoContaCad.DFC1Click(Sender: TObject);
  var AnoMesAtual, AnoMesAnterior, Mes: String;
    Ano, Filial : Integer;
begin
  inherited;
  if FPlanoContasParam = nil then
    FPlanoContasParam := TFPlanoContasParam.Create(Application);
  FPlanoContasParam.PGRelatorio.Pages[2].TabVisible:=True;
  if FPlanoContasParam.ShowModal = mrOK then
  begin
    AnoMesAtual := FPlanoContasParam.me2periodo.Text;
    Ano := StrToInt(copy(AnoMesAtual, 1, 4));
    Mes := copy(AnoMesAtual, 6, 2);
    if Trim(FPlanoContasParam.Fm2Filial.MeFilial.Text) <> '' then
      Filial := strtoint(Trim(FPlanoContasParam.Fm2Filial.MeFilial.Text));
    AnoMesAtual := inttostr(Ano) + Mes;
    AnoMesAnterior := inttostr(Ano - 1) + Mes;
    with DMPlanoConta do
    begin
      QRDFC.Close;
      QRDFC.SetVariable('ANOMES', AnoMesAtual);
      if Trim(FPlanoContasParam.Fm2Filial.MeFilial.Text) <> '' then
        QRDFC.SetVariable('FILIAL', Filial)
      else
        QRDFC.SetVariable('FILIAL', null);
      QRDFC.Open;
    end;

    if FRDfc = nil then
      FRDfc := TFRDfc.Create(Application);
    with DMPlanoConta do
    begin
      QRSaldoDFC.Close;
      QRSaldoDFC.SetVariable('ANOMES', AnoMesAnterior);
      if Trim(FPlanoContasParam.Fm2Filial.MeFilial.Text) <> '' then
        QRSaldoDFC.SetVariable('FILIAL', Filial)
      else
        QRSaldoDFC.SetVariable('FILIAL', null);
      QRSaldoDFC.Open;
      FRDfc.lbInicioAnterior.Caption := FormatFloat('#,##0.00', QRSaldoDFCVAL_ANTERIOR.Value);
      FRDfc.lbFinalAnterior.Caption := FormatFloat('#,##0.00', QRSaldoDFCVAL_ATUAL.Value);

      QRSaldoDFC.Close;
      QRSaldoDFC.SetVariable('ANOMES', AnoMesAtual);
      if Trim(FPlanoContasParam.Fm2Filial.MeFilial.Text) <> '' then
        QRSaldoDFC.SetVariable('FILIAL', Filial)
      else
        QRSaldoDFC.SetVariable('FILIAL', null);
      QRSaldoDFC.Open;
      FRDfc.lbInicioAtual.Caption := FormatFloat('#,##0.00', QRSaldoDFCVAL_ANTERIOR.Value);
      FRDfc.lbFinalAtual.Caption := FormatFloat('#,##0.00', QRSaldoDFCVAL_ATUAL.Value);
    end;


    FRDfc.qrlbAnterior.caption := Mes + '/' + IntToStr(Ano - 1);
    FRDfc.qrlbAtual.caption := Mes + '/' + IntToStr(Ano);
    FRDfc.PNumero := StrToInt(Trim(FPlanoContasParam.MEPag.Text));
    FRDfc.QRPrimario.Preview;
  end;
end;

end.
