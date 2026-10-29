unit UVendedorParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmDepartamento,
  UFmVendedor, UFmFilial, UFmProduto, UFmEstado;

type
  TFVendedorParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Rg0Situacao: TRadioGroup;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    ME2Vendedor: TMaskEdit;
    SB2Vendedor: TSpeedButton;
    Ed2Vendedor: TEdit;
    Me2Classe: TMaskEdit;
    Label3: TLabel;
    SB2Classe: TSpeedButton;
    Ed2Classe: TEdit;
    ME2Ano: TMaskEdit;
    Label4: TLabel;
    TabSheet4: TTabSheet;
    Rg3Situacao: TRadioGroup;
    TabSheet5: TTabSheet;
    edt4Ano: TEdit;
    Label5: TLabel;
    edt4Mes: TEdit;
    Label6: TLabel;
    FmDepartamento1: TFmDepartamento;
    FmVendedor2: TFmVendedor;
    TabSheet6: TTabSheet;
    Fm5Supervisor: TFmVendedor;
    Fm5Vendedor: TFmVendedor;
    Fm5Produto: TFmProduto;
    Fm5Filial: TFmFilial;
    FmVendedor1: TFmVendedor;
    FmEstado1: TFmEstado;
    procedure SB2VendedorClick(Sender: TObject);
    procedure SB2ClasseClick(Sender: TObject);
    procedure ME2VendedorExit(Sender: TObject);
    procedure Me2ClasseExit(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorParam: TFVendedorParam;

implementation

uses UVendedorCons, UVendedor_cl, UOracle_cl, UDepartamentoCons,
  UDepartamento_cl, UClasseCons, UClasse_cl;

{$R *.DFM}

procedure TFVendedorParam.SB2VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    ME2Vendedor.Text := QVendedorConsCod_Vendedor.Text;
    ME2VendedorExit(Self);
  End;
end;

procedure TFVendedorParam.SB2ClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil Then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  with DMClasse do
    begin
      ME2Classe.Text := QClasseConsCod_Classe.Text;
      ME2ClasseExit(self);
    end;  
end;

procedure TFVendedorParam.ME2VendedorExit(Sender: TObject);
begin
  inherited;
 If Trim(ME2Vendedor.Text)<>'' Then
    Ed2Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME2Vendedor.Text)
  Else
    Ed2Vendedor.Text:='TODOS';
end;

procedure TFVendedorParam.Me2ClasseExit(Sender: TObject);
begin
  inherited;
 If Trim(ME2Classe.Text)<>'' Then
    Ed2Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+ME2Classe.Text)
  Else
    Ed2Classe.Text:='TODOS';
end;

procedure TFVendedorParam.TabSheet5Show(Sender: TObject);
var d, m, a : word;
begin
  inherited;

  DecodeDate(date, a, m, d);

  if trim(edt4Ano.Text) = '' then
    edt4Ano.Text := IntToStr(a);

  if trim(edt4Mes.Text) = '' then
    edt4Mes.Text := IntToStr(m);

end;

end.
