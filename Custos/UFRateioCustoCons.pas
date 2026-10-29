unit UFRateioCustoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, variants;

type
  TFRateio_CustoCons = class(TFTConsulta)
    Label4: TLabel;
    Label5: TLabel;
    EdCodDepartamento: TEdit;
    EdCodPlano: TEdit;
    SB_FilialCons: TSpeedButton;
    SB_DepartamentoCons: TSpeedButton;
    SB_PlanoContaCons: TSpeedButton;
    EdDescFilial: TEdit;
    EdDescDepartamento: TEdit;
    EdDescPlano: TEdit;
    procedure METextoExit(Sender: TObject);
    procedure SB_FilialConsClick(Sender: TObject);
    procedure EdCodDepartamentoExit(Sender: TObject);
    procedure SB_DepartamentoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure EdCodPlanoExit(Sender: TObject);
    procedure SB_PlanoContaConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRateio_CustoCons: TFRateio_CustoCons;

implementation

uses UDMCustos, UOracle_cl, UFilialCons, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl, UFCustoCons, UPlanoContaCons, UPlanoConta_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFRateio_CustoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
     FRateio_CustoCons.EdDescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL='+METexto.Text)
  else
  begin
    METexto.Text := '';
    EdDescFilial.Text := '';
  end;

end;

procedure TFRateio_CustoCons.SB_FilialConsClick(Sender: TObject);
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

procedure TFRateio_CustoCons.EdCodDepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(FRateio_CustoCons.EdCodDepartamento.Text) <> '' then
  begin
    FRateio_CustoCons.EdDescDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                        'COD_DEPARTAMENTO = '+FRateio_CustoCons.EdCodDepartamento.Text);

  end
  else
  begin
    EdCodDepartamento.Text := '';
    EdDescDepartamento.Text := '';
  end;
end;

procedure TFRateio_CustoCons.SB_DepartamentoConsClick(Sender: TObject);
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

procedure TFRateio_CustoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'CUSTOS');
  with DMCustos do
  begin
    QRateio_CustosCons.Close;

    if Trim(FRateio_CustoCons.METexto.Text) <> '' then
       QRateio_CustosCons.SetVariable('COD_FILIAL_ORIG',METexto.Text)
    else
       QRateio_CustosCons.SetVariable('COD_FILIAL_ORIG',Null);

    if Trim(FRateio_CustoCons.EdCodDepartamento.Text) <> '' then
       QRateio_CustosCons.SetVariable('COD_DPTO_ORIG',EdCodDepartamento.Text)
    else
       QRateio_CustosCons.SetVariable('COD_DPTO_ORIG',Null);

    if Trim(FRateio_CustoCons.EdCodPlano.Text) <> '' then
       QRateio_CustosCons.SetVariable('COD_PLANO_CONTA',EdCodPlano.Text)
    else
       QRateio_CustosCons.SetVariable('COD_PLANO_CONTA',Null);
    QRateio_CustosCons.Open;
  end;
end;

procedure TFRateio_CustoCons.EdCodPlanoExit(Sender: TObject);
begin
  inherited;
  if EdCodPlano.Text <> '' then
     EdDescPlano.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                        'COD_PLANO_CONTA = '+FRateio_CustoCons.EdCodPlano.Text)
  else
   Begin
    EdDescPlano.Text:= '';
    EdCodPlano.Text := '';
   End;
end;

procedure TFRateio_CustoCons.SB_PlanoContaConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);

  if FPlanoContaCons.ShowModal = mrOk then
  begin
    EdDescPlano.Text := DMPlanoConta.QPlanoContaConsDESC_PLANO_CONTA.Value;
    EdCodPlano.Text  := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Text;
  end;

end;

end.
