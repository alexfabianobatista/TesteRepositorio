unit ULiberaPedidosParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFLiberaPedidosParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label74: TLabel;
    Label75: TLabel;
    Me1Filial: TMaskEdit;
    Sb1Filial: TBitBtn;
    Ed1Filial: TEdit;
    Me1Vendedor: TMaskEdit;
    Sb1Vendedor: TBitBtn;
    Ed1Vendedor: TEdit;
    GroupBox13: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Me1DtInicial: TMaskEdit;
    Me1DtFinal: TMaskEdit;
    Label1: TLabel;
    Me1Cidade: TMaskEdit;
    Bt1Cidade: TBitBtn;
    Ed1Cidade: TEdit;
    Label2: TLabel;
    ME1Departamento: TMaskEdit;
    bt1Departamento: TBitBtn;
    ed1Departamento: TEdit;
    Rg1Opcao: TRadioGroup;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Sb0Vendedor: TSpeedButton;
    Label4: TLabel;
    Sb0Filial: TSpeedButton;
    Me0Vendedor: TMaskEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Me0DtInicial: TMaskEdit;
    Me0DtFinal: TMaskEdit;
    ed0Vendedor: TEdit;
    Me0Filial: TMaskEdit;
    ed0Filial: TEdit;
    procedure Me1FilialExit(Sender: TObject);
    procedure Sb1FilialClick(Sender: TObject);
    procedure Me1VendedorExit(Sender: TObject);
    procedure Sb1VendedorClick(Sender: TObject);
    procedure Me1CidadeExit(Sender: TObject);
    procedure Bt1CidadeClick(Sender: TObject);
    procedure ME1DepartamentoExit(Sender: TObject);
    procedure bt1DepartamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaPedidosParam: TFLiberaPedidosParam;

implementation

uses UOracle_cl, UVendedorCons, UVendedor_cl, UFilialCons, UCidadeCons,
  UFilial_cl, UCidade_cl, UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFLiberaPedidosParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.Text) <> '' then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                         'COD_Filial = '+Trim(ME1Filial.Text))
  else
    Ed1Filial.Text := 'Todas';

end;

procedure TFLiberaPedidosParam.Sb1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me1FilialExit(Self);

end;

procedure TFLiberaPedidosParam.Me1VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Vendedor.Text) <> '' then
    Ed1Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(Me1Vendedor.Text))
  Else
    Ed1Vendedor.Text := 'Todos';

end;

procedure TFLiberaPedidosParam.Sb1VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me1Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me1VendedorExit(self);

end;

procedure TFLiberaPedidosParam.Me1CidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Cidade.Text) <> '' then
    Ed1Cidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE',
                                         'COD_CIDADE = '+Trim(Me1Cidade.Text))
  Else
    Ed1Cidade.Text := 'Todos';

end;

procedure TFLiberaPedidosParam.Bt1CidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = mrOk then
    Me1Cidade.Text := DMCidade.QCidadeConsCod_Cidade.Text;
  Me1CidadeExit(self);

end;

procedure TFLiberaPedidosParam.ME1DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Departamento.Text) <> '' then
    Ed1Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                         'COD_DEPARTAMENTO = '+Trim(Me1Departamento.Text))
  Else
    Ed1Departamento.Text := 'Todos';
end;

procedure TFLiberaPedidosParam.bt1DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
  begin
    Me1Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
    Me1DepartamentoExit(self);
  end;
end;

end.
