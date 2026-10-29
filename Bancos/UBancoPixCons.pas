unit UBancoPixCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBancoAgencia_cl, UTConsulta, Menus, DB, Grids, DBGrids, StrUtils,
  StdCtrls, Mask, Buttons, Cemapa.Conversoes.API;

type
  TFBancoPixCons = class(TFTConsulta)
    cbPSPContaPix: TComboBox;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPSPContaPixChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PopularComboBox(combo: TComboBox);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoPixCons: TFBancoPixCons;

implementation

uses TypInfo;

{$R *.dfm}

procedure TFBancoPixCons.BtProcurarClick(Sender: TObject);
var
  bancoNome: String;
  codPSPBanco: Integer;
begin
  inherited;
  With DMBancoAgencia do
  Begin
    QContaPixCons.Close;
    QContaPixCons.SetVariable('COD_PSP_BANCO',cbPSPContaPix.ItemIndex);
    QContaPixCons.Open;
  end;
end;

procedure TFBancoPixCons.FormShow(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFBancoPixCons.PopularComboBox(combo: TComboBox);
var
  pspBancoPix : TTipoBancoPix;
begin
  Combo.Clear;
  for pspBancoPix := tbpBancodoBrasil to tbpMatera do
  begin
    if not (pspBancoPix in([tbpMercadoPago..tbpMatera])) then
      Combo.Items.Add(GetEnumName(TypeInfo(TTipoBancoPix),Integer(pspBancoPix)));
  end;

end;

procedure TFBancoPixCons.cbPSPContaPixChange(Sender: TObject);
begin
  inherited;
  With DMBancoAgencia do
  Begin
    QContaPixCons.Close;
    QContaPixCons.SetVariable('COD_PSP_BANCO',cbPSPContaPix.ItemIndex);
    QContaPixCons.Open;
  end;
end;

procedure TFBancoPixCons.FormCreate(Sender: TObject);
begin
  inherited;
  PopularComboBox(cbPSPContaPix);
end;

end.
