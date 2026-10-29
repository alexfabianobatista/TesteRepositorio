unit UFCustoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, DBCtrls, StdCtrls, ExtCtrls, Db, Grids, DBGrids, Mask,
  Buttons, variants;

type
  TFCustosCons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    SB_FilialCons: TSpeedButton;
    Label4: TLabel;
    SB_DepartamentoCons: TSpeedButton;
    Label5: TLabel;
    SB_HistoricoCons: TSpeedButton;
    EdDescDepartamento: TEdit;
    EdDescPlanoConta: TEdit;
    EdCodDepartamento: TEdit;
    EdCodPlanoContas: TEdit;
    ME_DataI: TMaskEdit;
    ME_DataF: TMaskEdit;
    EdDescFilial: TEdit;
    procedure SB_FilialConsClick(Sender: TObject);
    procedure SB_HistoricoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SB_DepartamentoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure EdCodDepartamentoChange(Sender: TObject);
    procedure EdCodPlanoContasChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustosCons: TFCustosCons;

implementation

uses UDMCustos, UOracle_cl, UFCustosCad, UFilialCons, UFilial_cl,
     UDepartamentoCons, UDepartamento_cl, UPlanoContaCons, UPlanoConta_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFCustosCons.SB_FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    EdDescFilial.Text := DMFilial.QFilialConsDESC_FILIAL.Value;
    METexto.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;

end;

procedure TFCustosCons.SB_HistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    EdDescPlanoConta.Text := DMPlanoConta.QPlanoContaConsDESC_PLANO_CONTA.Value;
    EdCodPlanoContas.Text := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Text;
  end;

end;

procedure TFCustosCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(METexto.Text,'CUSTOS');
  with DMCustos do
  begin
    QCustoCons.Close;

    if Trim(FCustosCons.METexto.Text) <> '' then
       QCustoCons.SetVariable('COD_FILIAL',METexto.Text)
    else
       QCustoCons.SetVariable('COD_FILIAL',Null);

    if Trim(FCustosCons.EdCodDepartamento.Text) <> '' then
       QCustoCons.SetVariable('COD_DEPARTAMENTO',EdCodDepartamento.Text)
    else
       QCustoCons.SetVariable('COD_DEPARTAMENTO',Null);

    if Trim(FCustosCons.EdCodPlanoContas.Text) <> '' then
       QCustoCons.SetVariable('COD_PLANO_CONTA',EdCodPlanoContas.Text)
    else
       QCustoCons.SetVariable('COD_PLANO_CONTA',Null);

    if Trim(ME_DataI.Text) <> '' then
       QCustoCons.SetVariable('DATA_I',ME_DataI.Text)
    else
       QCustoCons.SetVariable('DATA_I',Date);

    if Trim(ME_DataF.Text) <> '' then
       QCustoCons.SetVariable('DATA_F',ME_DataF.Text)
    else
       QCustoCons.SetVariable('DATA_F',Date);

    QCustoCons.Open;

  end;
end;

procedure TFCustosCons.SB_DepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    EdDescDepartamento.Text := DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    EdCodDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;

end;

procedure TFCustosCons.FormActivate(Sender: TObject);
begin
  inherited;
  ME_DataI.Text := DateToStr(Date);
  ME_DataF.Text := DateToStr(Date);
end;

procedure TFCustosCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
     EdDescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+METexto.Text)
  else
     EdDescFilial.Text := '';

end;

procedure TFCustosCons.EdCodDepartamentoChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCodDepartamento.Text) <> '' then
     EdDescDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                        'COD_DEPARTAMENTO = '+EdCodDepartamento.Text)
  else
     EdDescDepartamento.Text := '';
end;

procedure TFCustosCons.EdCodPlanoContasChange(Sender: TObject);
begin
  inherited;
  if EdCodPlanoContas.Text <> '' then
     EdDescPlanoConta.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                        'COD_PLANO_CONTA = '+EdCodPlanoContas.Text)
  Else
     EdDescPlanoConta.Text := '';
end;

end.
