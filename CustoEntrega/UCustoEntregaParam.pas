unit UCustoEntregaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFCustoEntregaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0Filial: TMaskEdit;
    SB0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Label120: TLabel;
    ME0Vendedor: TMaskEdit;
    SB0Vendedor: TBitBtn;
    Ed0Vendedor: TEdit;
    SB0CodNota: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ME0CodNota: TMaskEdit;
    GroupBox0Data: TGroupBox;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure SB0VendedorClick(Sender: TObject);
    procedure ME0VendedorExit(Sender: TObject);
    procedure SB0FilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure SB0CodNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoEntregaParam: TFCustoEntregaParam;

implementation

uses UVendedorCons, UVendedor_cl, UOracle_cl, UFilialCons, UFilial_cl,
  UNotaSaidaCons, UCustoEntrega_cl, UNotaSaida_cl;

{$R *.DFM}

procedure TFCustoEntregaParam.SB0VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME0VendedorExit(Self);
  End;  
end;

procedure TFCustoEntregaParam.ME0VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Vendedor.Text) <> '' Then
    Ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                                       'COD_VENDEDOR = '+Trim(ME0Vendedor.Text))
  Else
    Ed0Vendedor.Text := 'Todos';

end;

procedure TFCustoEntregaParam.SB0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me0FilialExit(Self);
  End;   
end;

procedure TFCustoEntregaParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Filial.Text) <> '' Then
  With DMFilial do
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                                       'COD_Filial = '+Trim(Me0Filial .Text))
  Else
    Ed0Filial.Text := 'Todos'; 
end;

procedure TFCustoEntregaParam.SB0CodNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons:=TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = mrOk then
  With DMCustoEntrega do
    ME0CodNota.Text:=IntToStr(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);   
end;

end.
