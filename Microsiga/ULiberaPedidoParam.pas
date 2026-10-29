unit ULiberaPedidoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFLiberaPedidoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Sb0Vendedor: TSpeedButton;
    Me0Vendedor: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Me0DtInicial: TMaskEdit;
    Me0DtFinal: TMaskEdit;
    ed0Vendedor: TEdit;
    Label4: TLabel;
    Sb0Filial: TSpeedButton;
    Me0Filial: TMaskEdit;
    ed0Filial: TEdit;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Sb1Vendedor: TSpeedButton;
    Sb1Filial: TSpeedButton;
    Me1Vendedor: TMaskEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Me1DtInicial: TMaskEdit;
    Me1DtFinal: TMaskEdit;
    ed1Vendedor: TEdit;
    Me1Filial: TMaskEdit;
    ed1Filial: TEdit;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Sb2Vendedor: TSpeedButton;
    Sb2Filial: TSpeedButton;
    Me2Vendedor: TMaskEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Me2DtInicial: TMaskEdit;
    Me2DtFinal: TMaskEdit;
    ed2Vendedor: TEdit;
    Me2Filial: TMaskEdit;
    ed2Filial: TEdit;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    Label14: TLabel;
    Sb0Supervisor: TSpeedButton;
    Me0Supervisor: TMaskEdit;
    Ed0Supervisor: TEdit;
    procedure Sb0VendedorClick(Sender: TObject);
    procedure Me0VendedorExit(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
    procedure Sb0FilialClick(Sender: TObject);
    procedure Me1VendedorExit(Sender: TObject);
    procedure Sb1VendedorClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Sb1FilialClick(Sender: TObject);
    procedure Me2VendedorExit(Sender: TObject);
    procedure Sb2VendedorClick(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure Sb2FilialClick(Sender: TObject);
    procedure Me0SupervisorExit(Sender: TObject);
    procedure Sb0SupervisorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaPedidoParam: TFLiberaPedidoParam;

implementation

uses UVendedorCons, UVendedor_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFLiberaPedidoParam.Sb0VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = MrOk Then
  begin
    Me0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me0VendedorExit(sender);
  end
end;

procedure TFLiberaPedidoParam.Me0VendedorExit(Sender: TObject);
begin
  inherited;
  if trim(Me0Vendedor.Text) <> '' then
    ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + Trim(Me0Vendedor.Text))
  else
    ed0Vendedor.Text := 'Todos';
end;

procedure TFLiberaPedidoParam.Me0FilialExit(Sender: TObject);
begin
  inherited;
  if trim(Me0Filial.Text) <> '' then
    ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me0filial.Text))
  else
    ed0Filial.Text := 'Todas';
end;

procedure TFLiberaPedidoParam.Sb0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = MrOk Then
  begin
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me0FilialExit(sender);
  end
end;

procedure TFLiberaPedidoParam.Me1VendedorExit(Sender: TObject);
begin
  inherited;
  if trim(Me1Vendedor.Text) <> '' then
    ed1Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + Trim(Me1Vendedor.Text))
  else
    ed1Vendedor.Text := 'Todos';
end;

procedure TFLiberaPedidoParam.Sb1VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = MrOk Then
  begin
    Me1Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me1VendedorExit(sender);
  end;
end;

procedure TFLiberaPedidoParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  if trim(Me1Filial.Text) <> '' then
    ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me1filial.Text))
  else
    ed1Filial.Text := 'Todas';
end;

procedure TFLiberaPedidoParam.Sb1FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = MrOk Then
  begin
    Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me1FilialExit(sender);
  end;
end;

procedure TFLiberaPedidoParam.Me2VendedorExit(Sender: TObject);
begin
  inherited;
  if trim(Me2Vendedor.Text) <> '' then
    ed2Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + Trim(Me2Vendedor.Text))
  else
    ed2Vendedor.Text := 'Todos';
end;

procedure TFLiberaPedidoParam.Sb2VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = MrOk Then
  begin
    Me2Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me2VendedorExit(sender);
  end;
end;

procedure TFLiberaPedidoParam.Me2FilialExit(Sender: TObject);
begin
  inherited;
  if trim(Me2Filial.Text) <> '' then
    ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me2Filial.Text))
  else
    ed2Filial.Text := 'Todas';
end;

procedure TFLiberaPedidoParam.Sb2FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = MrOk Then
  begin
    Me2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me2FilialExit(sender);
  end;
end;

procedure TFLiberaPedidoParam.Me0SupervisorExit(Sender: TObject);
begin
  inherited;
   if Trim(ME0Supervisor.text)<>'' then
    Ed0SuperVisor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME0Supervisor.text)
   else
    Ed0SuperVisor.text:='Todos';

end;

procedure TFLiberaPedidoParam.Sb0SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me0Supervisor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me0SupervisorExit(Self);

end;

end.
