unit UPatrimonio_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFPatrimonio_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label2: TLabel;
    ME1Filial: TMaskEdit;
    Bt1ConsFilial: TBitBtn;
    Ed1Filial: TEdit;
    Label1: TLabel;
    Me1Cadastro: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Cadastro: TEdit;
    Label3: TLabel;
    Me1Departamento: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed1Departamento: TEdit;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Me2Filial: TMaskEdit;
    Label5: TLabel;
    Me2Cadastro: TMaskEdit;
    Label6: TLabel;
    Me2Departamento: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed2Departamento: TEdit;
    Ed2Cadastro: TEdit;
    Ed2Filial: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label7: TLabel;
    Me2Patrimonio: TMaskEdit;
    BitBtn6: TBitBtn;
    Ed2Patrimonio: TEdit;
    Rg1Situacao: TRadioGroup;
    Rg2Situacao: TRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    MEDT_Fim: TMaskEdit;
    Label9: TLabel;
    MEDT_Ini: TMaskEdit;
    Label8: TLabel;
    TabSheet4: TTabSheet;
    EDDescPatrimonio: TEdit;
    Label10: TLabel;
    BTPatrimonioParam: TBitBtn;
    EDDescOS: TEdit;
    Label11: TLabel;
    EDPrioridade: TEdit;
    EDDescPrioridade: TEdit;
    Label13: TLabel;
    EDDescDepartamento: TEdit;
    Departamento: TLabel;
    EDSupervisor: TEdit;
    EDDescSupervisor: TEdit;
    Label14: TLabel;
    EDDepartamento: TEdit;
    EDTipoServico: TEdit;
    EDDescTipoServico: TEdit;
    Label12: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    MENumOS: TMaskEdit;
    MEPatrimonioItem: TMaskEdit;
    TabSheet5: TTabSheet;
    Label15: TLabel;
    MEDepartamento: TMaskEdit;
    EDDescricaoDepartamento: TEdit;
    BitBtn12: TBitBtn;
    METipoServico: TMaskEdit;
    Label16: TLabel;
    BitBtn13: TBitBtn;
    EDDESC_TIPO_SERVICO: TEdit;
    GroupBox2: TGroupBox;
    MEDT_I: TMaskEdit;
    MEDT_F: TMaskEdit;
    MEPrioridade: TMaskEdit;
    BitBtn14: TBitBtn;
    EDDesc_Prioridade: TEdit;
    Label17: TLabel;
    MESupervisor: TMaskEdit;
    BitBtn15: TBitBtn;
    EDDescricaoSupervisor: TEdit;
    Label18: TLabel;
    TabSheet6: TTabSheet;
    MECodTipoEqui: TMaskEdit;
    MEDescTipoEqui: TMaskEdit;
    Label19: TLabel;
    BitBtn16: TBitBtn;
    TabSheet7: TTabSheet;
    Label20: TLabel;
    ME7Funcionario: TMaskEdit;
    BitBtn17: TBitBtn;
    EDDesc_Funcionario: TEdit;
    GroupBox3: TGroupBox;
    ME7DT_Marcacao_I: TMaskEdit;
    ME7DT_Marcacao_f: TMaskEdit;
    Label21: TLabel;
    Label22: TLabel;
    procedure ME1FilialExit(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure Me1DepartamentoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure Me2CadastroExit(Sender: TObject);
    procedure Me2DepartamentoExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Me2PatrimonioExit(Sender: TObject);
    procedure BTPatrimonioParamClick(Sender: TObject);
    procedure EDPrioridadeExit(Sender: TObject);
    procedure EDDepartamentoExit(Sender: TObject);
    procedure EDSupervisorExit(Sender: TObject);
    procedure EDTipoServicoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EDNumOSChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure MENumOSExit(Sender: TObject);
    procedure EDNumOSExit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure METipoServicoExit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure MEPrioridadeExit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure MESupervisorExit(Sender: TObject);
    procedure MEPatrimonioItemChange(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure MECodTipoEquiChange(Sender: TObject);
    procedure ME7FuncionarioExit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonio_Param: TFPatrimonio_Param;

implementation

uses UFilial_cl, UCadastro_cl, UDepartamento_cl, UCadastroCons,
  UDepartamentoCons, UFilialCons, UpatrimonioCons, Upatrimonio_cl,
  UOSPatrimonio_cl, UOSPatrimonioCons, UEncerramentoOS, UPatrimonioItemCons,
  UPrioridade_cl, UFuncionario_cl, UTipoServico_cl, UPrioridadeCons,
  UFFuncionarioCons, UTipoServicoCons, UTipoEquipamentoCarac_Cons,
  UTipoEquipamento_cl, UOracle_cl, UTipoEquipamentoCons;

{$R *.DFM}

procedure TFPatrimonio_Param.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME1Filial.Text);
    QFilial.Open;
    Ed1Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed1Filial.Text := 'Todas';
end;

procedure TFPatrimonio_Param.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;
end;

procedure TFPatrimonio_Param.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',ME1Cadastro.Text);
    QCadastro.Open;
    Ed1Cadastro.Text := QCadastroNome.Text;
  End
  Else
    Ed1Cadastro.Text := 'Todos';
end;

procedure TFPatrimonio_Param.Me1DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Departamento.Text) <> '' Then
  With DMDepartamento do
  Begin
    QDepartamento.Close;
    QDepartamento.SetVariable('PK',ME1Departamento.Text);
    QDepartamento.Open;
    Ed1Departamento.Text := QDepartamentoDesc_Departamento.Text;
  End
  Else
    Ed1Departamento.Text := 'Todos';
end;

procedure TFPatrimonio_Param.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(Self);
  End;
end;

procedure TFPatrimonio_Param.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    ME1Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME1DepartamentoExit(Self);
  End;
end;
procedure TFPatrimonio_Param.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;

end;

procedure TFPatrimonio_Param.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME2Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME2CadastroExit(Self);
  End;

end;

procedure TFPatrimonio_Param.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    ME2Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME2DepartamentoExit(Self);
  End;

end;

procedure TFPatrimonio_Param.Me2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME2Filial.Text);
    QFilial.Open;
    Ed2Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed2Filial.Text := 'Todas';

end;

procedure TFPatrimonio_Param.Me2CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Cadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',ME2Cadastro.Text);
    QCadastro.Open;
    Ed2Cadastro.Text := QCadastroNome.Text;
  End
  Else
    Ed2Cadastro.Text := 'Todos';

end;

procedure TFPatrimonio_Param.Me2DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Departamento.Text) <> '' Then
  With DMDepartamento do
  Begin
    QDepartamento.Close;
    QDepartamento.SetVariable('PK',ME2Departamento.Text);
    QDepartamento.Open;
    Ed2Departamento.Text := QDepartamentoDesc_Departamento.Text;
  End
  Else
    Ed2Departamento.Text := 'Todos';
end;

procedure TFPatrimonio_Param.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = Nil then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk then
  Begin
    ME2Patrimonio.Text := DMPatrimonio.QPatrimonio_ConsCOD_PATRIMONIO.Text;
    ME2PatrimonioExit(Self);
  End;

end;

procedure TFPatrimonio_Param.Me2PatrimonioExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Patrimonio.Text) <> '' Then
  With DMPatrimonio do
  Begin
    QPatrimonio_Cons.Close;
    QPatrimonio_Cons.SetVariable('COD_PAT',ME2Patrimonio.Text);
    QPatrimonio_Cons.Open;
    Ed2Patrimonio.Text := QPatrimonio_ConsDesc_Patrimonio.Text;
  End
  Else
    Ed2Patrimonio.Text := 'Todos';

end;

procedure TFPatrimonio_Param.BTPatrimonioParamClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioItemCons = Nil then
    FPatrimonioItemCons := TFPatrimonioItemCons.Create(Application);
  If FPatrimonioItemCons.ShowModal = mrOk then
  Begin
    MEPatrimonioitem.text:=DMPatrimonio.QPatrimonio_Item_ConsCod_Patrimonio_Item.value;
  end;
end;

procedure TFPatrimonio_Param.EDPrioridadeExit(Sender: TObject);
begin
  inherited;
  If Trim(EDPrioridade.Text) <> '' Then
  With DMPrioridade do
  Begin
    QPrioridade.Close;
    QPrioridade.SetVariable('PK',EDPrioridade.text);
    QPrioridade.Open;
    EDDescPrioridade.Text := QPrioridadeDesc_Prioridade.value;
  End
  Else
    EDDescPrioridade.Text := 'Todas';
end;

procedure TFPatrimonio_Param.EDDepartamentoExit(Sender: TObject);
begin
  inherited;
  With DMDepartamento do
  If Trim(EDDepartamento.Text) <> '' Then
  Begin
    QDepartamento.Close;
    QDepartamento.SetVariable('PK',EDDepartamento.text);
    QDepartamento.Open;
    EDDescDepartamento.Text := QDepartamentoDesc_Departamento.value;
  End
  Else
   EDDescDepartamento.Text := 'Todos';
end;

procedure TFPatrimonio_Param.EDSupervisorExit(Sender: TObject);
begin
  inherited;
  With DMFuncionario do
  If Trim(EDSupervisor.Text) <> '' Then
  Begin
    QFuncionario.Close;
    QFuncionario.SetVariable('PK',EDSupervisor.text);
    QFuncionario.Open;
    EDDescSupervisor.Text := QFuncionarioDesc_Funcionario.value;
  End
  Else
   EDDescSupervisor.Text := 'Todos';
end;

procedure TFPatrimonio_Param.EDTipoServicoExit(Sender: TObject);
begin
  inherited;
  With DMTipoServico do
  If Trim(EDTipoServico.Text) <> '' Then
  Begin
    QTipoServico.Close;
    QTipoServico.SetVariable('PK',EDTipoServico.text);
    QTipoServico.Open;
    EDDescTipoServico.Text := QTipoServicoDesc_tipo_servico.value;
  End
  Else
   EDDescTipoServico.Text := 'Todos';
end;

procedure TFPatrimonio_Param.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FPrioridadeCons = Nil then
    FPrioridadeCons := TFPrioridadeCons.Create(Application);
  If FPrioridadeCons.showModal = mrOk then
    EDPrioridade.text:= DMPrioridade.QPrioridadeConsCod_Prioridade.Value;

end;

procedure TFPatrimonio_Param.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    EDDepartamento.text:= IntToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFPatrimonio_Param.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
    EDSupervisor.text:= IntToStr(DMFuncionario.QFuncionarioConsCod_Funcionario.Value);
end;

procedure TFPatrimonio_Param.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
    EDTipoServico.text:= DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;

end;

procedure TFPatrimonio_Param.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.showModal = mrOk then
    MENumOS.text:= IntToStr(DMOSPatrimonio.QOSPatrimonioConsNum_OS_CAB.Value);

end;

procedure TFPatrimonio_Param.EDNumOSChange(Sender: TObject);
begin
  inherited;
  If Trim(MENumOS.Text) <> '' Then
  With DMOSPatrimonio do
  Begin
    QOSPatrimonioCons.Close;
    QOSPatrimonioCons.SetVariable('NUM_OS_CAB',MENumOS.Text);
    QOSPatrimonioCons.Open;
    EDDescOS.Text := QOSPatrimonioConsDesc_OS_Patrimonio.value;
  End
  Else
    EDDescOS.Text := 'Todas';
end;

procedure TFPatrimonio_Param.BitBtn7Click(Sender: TObject);
begin
  inherited;
   If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.showModal = mrOk then
  Begin
     MENumOS.text:= IntToStr(DMOSPatrimonio.QOSPatrimonioConsNum_OS_CAB.Value);
     MENumOSExit(self);
  end;
end;

procedure TFPatrimonio_Param.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FPrioridadeCons = Nil then
    FPrioridadeCons := TFPrioridadeCons.Create(Application);
  If FPrioridadeCons.showModal = mrOk then
  Begin
    EDPrioridade.text:= DMPrioridade.QPrioridadeConsCod_Prioridade.Value;
    EDPrioridadeExit(self);
  end;

end;

procedure TFPatrimonio_Param.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    EDDepartamento.text:= IntToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    EDDepartamentoExit(Self);
  End;
end;

procedure TFPatrimonio_Param.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
  Begin
    EDSupervisor.text:= IntToStr(DMFuncionario.QFuncionarioConsCod_Funcionario.Value);
    EDSupervisorExit(self);
  end;
end;

procedure TFPatrimonio_Param.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
  Begin
    EDTipoServico.text:= DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;
    EDTipoServicoExit(self);
  end;

end;

procedure TFPatrimonio_Param.MENumOSExit(Sender: TObject);
begin
  inherited;
  If Trim(MENumOS.Text) <> '' Then
  With DMOSPatrimonio do
  Begin
    QOSPatrimonio.Close;
    QOSPatrimonio.SetVariable('PK',MENumOS.Text);
    QOSPatrimonio.Open;
    EDDescOS.Text := QOSPatrimonioDesc_OS_Patrimonio.value;
  End
  Else
    EDDescPrioridade.Text := 'Todas';
end;

procedure TFPatrimonio_Param.EDNumOSExit(Sender: TObject);
begin
  inherited;
  If Trim(MENumOS.Text) <> '' Then
  With DMOSPatrimonio do
  Begin
    QOSPatrimonio.Close;
    QOSPatrimonio.SetVariable('PK',MENumOS.text);
    QOSPatrimonio.Open;
    EDDescOS.Text := QOSPatrimonioDesc_OS_Patrimonio.value;
  End
  Else
    EDDescOS.Text := 'Todas';
end;


procedure TFPatrimonio_Param.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  begin
    MEDepartamento.text := IntToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    MEDepartamentoExit(self);
  end;
end;

procedure TFPatrimonio_Param.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.text) <> '' then
    with DMDepartamento do
    Begin
      QDepartamento.close;
      QDepartamento.setVariable('PK', trim(MEDepartamento.text));
      QDepartamento.open;
      EDDescricaoDepartamento.text:=QDepartamentoDesc_Departamento.value;
    end
    else
      EDDescricaoDepartamento.text:= 'Todos';
end;

procedure TFPatrimonio_Param.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
  begin
    METipoServico.text := DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;
    METipoServicoExit(self);
  end;
end;

procedure TFPatrimonio_Param.METipoServicoExit(Sender: TObject);
begin
  inherited;
  If trim(METipoServico.text) <> '' then
  begin
    with DMTipoServico do
    Begin
      QTipoServico.close;
      QTipoServico.setVariable('PK', trim(METipoServico.text));
      QTipoServico.open;
      EDDesc_Tipo_Servico.text:=QTipoServicoDesc_Tipo_Servico.value;
    end;
  end
  else
    EDDesc_Tipo_Servico.text:= 'Todos';
end;

procedure TFPatrimonio_Param.BitBtn14Click(Sender: TObject);
begin
  inherited;
  with DMPrioridade do
  begin
    If FPrioridadeCons = Nil then
      FPrioridadeCons := TFPrioridadeCons.Create(Application);
    If FPrioridadeCons.showModal = mrOk then
    begin
      MEPrioridade.text := QPrioridadeConsCod_Prioridade.Value;
      MEPrioridadeExit(self);
    end;
  end;
end;

procedure TFPatrimonio_Param.MEPrioridadeExit(Sender: TObject);
begin
  inherited;
  if trim(MEPrioridade.text) <> '' then
    with DMPrioridade do
    Begin
      QPrioridade.close;
      QPrioridade.setVariable('PK', trim(MEPrioridade.text));
      QPrioridade.open;
      EDDesc_Prioridade.text:=QPrioridadeDesc_Prioridade.value;
    end
    else
      EDDesc_Prioridade.text:='Todas';
end;

procedure TFPatrimonio_Param.BitBtn15Click(Sender: TObject);
begin
  inherited;
  with DMFuncionario do
  begin
    If FFuncionarioCons = Nil then
      FFuncionarioCons := TFFuncionarioCons.Create(Application);
    If FFuncionarioCons.showModal = mrOk then
    begin
      MESupervisor.text := IntToStr(QFuncionarioConsCod_Funcionario.Value);
      MESupervisorExit(self);
    end;
  end;
end;

procedure TFPatrimonio_Param.MESupervisorExit(Sender: TObject);
begin
  inherited;
  if trim(MESupervisor.text) <> '' then
    with DMFuncionario do
    Begin
      QFuncionario.close;
      QFuncionario.setVariable('PK', trim(MESupervisor.text));
      QFuncionario.open;
      EDDescricaoSupervisor.text:=QFuncionarioDesc_Funcionario.value;
    end
    else
      EDDescricaoSupervisor.text:='Todos';
end;

procedure TFPatrimonio_Param.MEPatrimonioItemChange(Sender: TObject);
begin
  inherited;
  if trim(MEPatrimonioItem.text) <> '' then
    with DMPatrimonio do
    Begin
      QPatrimonio_Item_Cons.close;
      QPatrimonio_Item_Cons.setVariable('COD_PATRIMONIO_ITEM' ,MEPatrimonioItem.text);
      QPatrimonio_Item_Cons.open;
      EDDescPatrimonio.text:=QPatrimonio_Item_ConsDesc_Patrimonio_Item.value;
    end
    else
      EDDescPatrimonio.text:= 'Todos';
end;

procedure TFPatrimonio_Param.BitBtn16Click(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCons = Nil then
    FTipoEquipamentoCons := TFTipoEquipamentoCons.Create(Application);
  If FTipoEquipamentoCons.ShowModal = mrOk then
  With DMTipoEquipamento do
  Begin
    MECodTipoEqui.Text := QTipoEquipamentoConsCod_Tipo_Equipamento.Text;
    MEDescTipoEqui.Text := QTipoEquipamentoConsDesc_Tipo_Equipamento.Text;
  End;

end;

procedure TFPatrimonio_Param.MECodTipoEquiChange(Sender: TObject);
begin
  inherited;
  If trim(MECodTipoEqui.text) <> '' then
    MEDescTipoEqui.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_EQUIPAMENTO FROM TB_TIPO_EQUIPAMENTO',
                       'COD_TIPO_EQUIPAMENTO = '+ CHR(39) + Trim(MECodTipoEqui.Text) + CHR(39) )
  else
    MEDescTipoEqui.Text:= 'TODOS';
end;

procedure TFPatrimonio_Param.ME7FuncionarioExit(Sender: TObject);
begin
  inherited;
  if trim(ME7Funcionario.text) <> '' then
  begin
     EDDesc_Funcionario.Text:=DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO',' COD_FUNCIONARIO = '+trim(ME7Funcionario.text));
  end
  else
     EDDesc_Funcionario.Text:='Todos';
end;

procedure TFPatrimonio_Param.BitBtn17Click(Sender: TObject);
begin
  inherited;
  with DMFuncionario do
  begin
    If FFuncionarioCons = Nil then
      FFuncionarioCons := TFFuncionarioCons.Create(Application);
    If FFuncionarioCons.showModal = mrOk then
    begin
      ME7Funcionario.text := IntToStr(QFuncionarioConsCod_Funcionario.Value);
      ME7FuncionarioExit(self);
    end;
  end;
end;

end.
