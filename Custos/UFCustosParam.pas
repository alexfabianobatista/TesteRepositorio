unit UFCustosParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFCustosParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    SB_FilialOCons: TSpeedButton;
    EdFilialOrigem: TEdit;
    SB_DptoOCons: TSpeedButton;
    EdDepartamentoOrigem: TEdit;
    SBHistoricoCons: TSpeedButton;
    Ed_PlanoDesc: TEdit;
    SB_FilialDCons: TSpeedButton;
    EdFilialDestino: TEdit;
    SB_DptoDCons: TSpeedButton;
    EdDepartamentoDestino: TEdit;
    ME_FilialOrigem: TMaskEdit;
    ME_DptoOrigem: TMaskEdit;
    ME_CodPlanoConta: TMaskEdit;
    ME_FilialDestino: TMaskEdit;
    ME_DptoDestino: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ME1_CodFilial: TMaskEdit;
    ME1_CodDepartamento: TMaskEdit;
    ME1_CodPlano: TMaskEdit;
    SB1_FilialCons: TSpeedButton;
    SB1_DepartamentoCons: TSpeedButton;
    SB1_HistoricoCons: TSpeedButton;
    Ed1_PlanoDesc: TEdit;
    Ed1_DepartamentoDesc: TEdit;
    Ed1_FilialDesc: TEdit;
    GB_Periodo: TGroupBox;
    ME1_DataI: TMaskEdit;
    ME1_DataF: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    ME2_CodFilial: TMaskEdit;
    Label12: TLabel;
    ME2_CodDepartamento: TMaskEdit;
    SBFilialCons: TSpeedButton;
    SB2DepartamentoCons: TSpeedButton;
    Ed2_DescFilial: TEdit;
    Ed2_DescDepartamento: TEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    ME2_DataI: TMaskEdit;
    ME2_DataF: TMaskEdit;
    Label15: TLabel;
    ME2_CodPlano: TMaskEdit;
    SB2HistoricoCons: TSpeedButton;
    Ed2_DescPlano: TEdit;
    TabSheet4: TTabSheet;
    Label16: TLabel;
    SpeedButton1: TSpeedButton;
    Label17: TLabel;
    SpeedButton2: TSpeedButton;
    ME3_CodFilial: TMaskEdit;
    ME3_CodDepartamento: TMaskEdit;
    Ed3_DescDepartamento: TEdit;
    Ed3_DescFilial: TEdit;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    ME3_DataI: TMaskEdit;
    ME3_DataF: TMaskEdit;
    procedure ME_FilialOrigemExit(Sender: TObject);
    procedure SB_FilialOConsClick(Sender: TObject);
    procedure ME_DptoOrigemExit(Sender: TObject);
    procedure SB_DptoOConsClick(Sender: TObject);
    procedure ME_FilialDestinoExit(Sender: TObject);
    procedure SB_FilialDConsClick(Sender: TObject);
    procedure ME_DptoDestinoExit(Sender: TObject);
    procedure ME1_CodFilialExit(Sender: TObject);
    procedure ME1_CodDepartamentoExit(Sender: TObject);
    procedure SB1_FilialConsClick(Sender: TObject);
    procedure SB1_DepartamentoConsClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure SB2HistoricoConsClick(Sender: TObject);
    procedure SB2DepartamentoConsClick(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure ME2_CodFilialChange(Sender: TObject);
    procedure ME2_CodDepartamentoChange(Sender: TObject);
    procedure ME2_CodPlanoChange(Sender: TObject);
    procedure ME3_CodFilialChange(Sender: TObject);
    procedure ME3_CodDepartamentoChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME1_CodPlanoExit(Sender: TObject);
    procedure SB1_HistoricoConsClick(Sender: TObject);
    procedure ME_CodPlanoContaExit(Sender: TObject);
    procedure SBHistoricoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustosParam: TFCustosParam;

implementation

uses UOracle_cl, UFilial_cl, UFilialCons, UDepartamentoCons,
  UDepartamento_cl, UUsuario_cl, UPlanoContaCons, UPlanoConta_cl;

{$R *.DFM}

procedure TFCustosParam.ME_FilialOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(ME_FilialOrigem.Text) <> '' then
  begin
    EdFilialOrigem.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+ME_FilialOrigem.Text);
  end
  else
  begin
    EdFilialOrigem.Text := '';
    ME_FilialOrigem.Text := '';
  end;
end;

procedure TFCustosParam.SB_FilialOConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    EdFilialOrigem.Text  := DMFilial.QFilialConsDESC_FILIAL.Value;
    ME_FilialOrigem.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFCustosParam.ME_DptoOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(ME_DptoOrigem.Text) <> '' then
  begin
    EdDepartamentoOrigem.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                       'COD_DEPARTAMENTO = '+ME_DptoOrigem.Text);
  end
  else
  begin
    EdDepartamentoOrigem.Text := '';
    ME_DptoOrigem.Text := '';
  end;
end;

procedure TFCustosParam.SB_DptoOConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    EdDepartamentoOrigem.Text:= DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    ME_DptoOrigem.Text       := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;
end;

procedure TFCustosParam.ME_FilialDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME_FilialDestino.Text) <> '' then
  begin
    EdFilialDestino.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+ME_FilialDestino.Text);
  end
  else
  begin
    EdFilialOrigem.Text := '';
    ME_FilialDestino.Text := '';
  end;
end;

procedure TFCustosParam.SB_FilialDConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    EdFilialDestino.Text  := DMFilial.QFilialConsDESC_FILIAL.Value;
    ME_FilialDestino.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFCustosParam.ME_DptoDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME_DptoDestino.Text) <> '' then
  begin
    EdDepartamentoDestino.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                       'COD_DEPARTAMENTO = '+ME_DptoDestino.Text);
  end
  else
  begin
    EdDepartamentoDestino.Text := '';
    ME_DptoDestino.Text := '';
  end;
end;

procedure TFCustosParam.ME1_CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1_CodFilial.Text) <> '' then
  begin
    Ed1_FilialDesc.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+ME1_CodFilial.Text);
  end
  else
  begin
    Ed1_FilialDesc.Text := '';
    ME1_CodFilial.Text := '';
  end;
end;

procedure TFCustosParam.ME1_CodDepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1_CodDepartamento.Text) <> '' then
  begin
    Ed1_DepartamentoDesc.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                       'COD_DEPARTAMENTO = '+ME1_CodDepartamento.Text);
  end
  else
  begin
    Ed1_DepartamentoDesc.Text:= '';
    ME1_CodDepartamento.Text := '';
  end;
end;

procedure TFCustosParam.SB1_FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    Ed1_FilialDesc.Text:=DMFilial.QFilialConsDESC_FILIAL.Value;
    ME1_CodFilial.Text :=DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFCustosParam.SB1_DepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    Ed1_DepartamentoDesc.Text:= DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    ME1_CodDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;
end;

procedure TFCustosParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  ME1_DataI.Text := DateToStr(DATE);
  ME1_DataF.Text := DateToStr(DATE);
end;

procedure TFCustosParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME1_CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFCustosParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  ME2_DataI.Text := DateToStr(DATE);
  ME2_DataF.Text := DateToStr(DATE);
end;

procedure TFCustosParam.SB2HistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    Ed2_DescPlano.Text:= DMPlanoConta.QPlanoContaConsDESC_PLANO_CONTA.Value;
    ME2_CodPlano.Text := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Text;
  end;
end;

procedure TFCustosParam.SB2DepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    Ed2_DescDepartamento.Text:= DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    ME2_CodDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;
end;

procedure TFCustosParam.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    Ed2_DescFilial.Text:=DMFilial.QFilialConsDESC_FILIAL.Value;
    ME2_CodFilial.Text :=DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFCustosParam.ME2_CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2_CodFilial.Text) <> '' then
  begin
    Ed2_DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                              'COD_FILIAL = '+ME2_CodFilial.Text);
  end
  else
  begin
    Ed2_DescFilial.Text := '';
  end;
end;

procedure TFCustosParam.ME2_CodDepartamentoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2_CodDepartamento.Text) <> '' then
  begin
    Ed2_DescDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                       'COD_DEPARTAMENTO = '+ME2_CodDepartamento.Text);
  end
  else
  begin
    Ed2_DescDepartamento.Text:= '';
  end;
end;

procedure TFCustosParam.ME2_CodPlanoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2_CodPlano.Text) <> '' then
    Ed2_DescPlano.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                       'COD_PLANO_CONTA = '+ME2_CodPlano.Text)
  else
    Ed2_DescPlano.Text:= ''
end;

procedure TFCustosParam.ME3_CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3_CodFilial.Text) <> '' then
  begin
    Ed3_DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                              'COD_FILIAL = '+ME3_CodFilial.Text);
  end
  else
  begin
    Ed3_DescFilial.Text := '';
  end;

end;

procedure TFCustosParam.ME3_CodDepartamentoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3_CodDepartamento.Text) <> '' then
  begin
    Ed3_DescDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                       'COD_DEPARTAMENTO = '+ME3_CodDepartamento.Text);
  end
  else
  begin
    Ed3_DescDepartamento.Text:= '';
  end;

end;

procedure TFCustosParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    Ed3_DescDepartamento.Text:= DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    ME3_CodDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;

end;

procedure TFCustosParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    Ed3_DescFilial.Text:=DMFilial.QFilialConsDESC_FILIAL.Value;
    ME3_CodFilial.Text :=DMFilial.QFilialConsCOD_FILIAL.Text;
  end;

end;

procedure TFCustosParam.ME1_CodPlanoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1_CodPlano.Text) <> '' then
    Ed1_PlanoDesc.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                        'COD_PLANO_CONTA = '+ME1_CodPlano.Text)
  else
  begin
    Ed1_PlanoDesc.Text:= '';
    ME1_CodPlano.Text := '';
  end;

end;

procedure TFCustosParam.SB1_HistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    Ed1_PlanoDesc.Text:= DMPlanoConta.QPlanoContaConsDESC_PLANO_CONTA.Value;
    ME1_CodPlano.Text := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Text;
  end;

end;

procedure TFCustosParam.ME_CodPlanoContaExit(Sender: TObject);
begin
  inherited;
  if Trim(ME_CodPlanoConta.Text) <> '' then
    Ed_PlanoDesc.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                            'COD_PLANO_CONTA = '+ME_CodPlanoConta.Text)
  else
  begin
    Ed_PlanoDesc.Text:= '';
    ME_CodPlanoConta.Text := '';
  end;

end;

procedure TFCustosParam.SBHistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
  begin
    Ed_PlanoDesc.Text:= DMPlanoConta.QPlanoContaConsDESC_PLANO_CONTA.Value;
    Me_CodPlanoConta.Text := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Text;
  end;
end;

end.
