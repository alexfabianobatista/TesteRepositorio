unit UPadraoConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFPadraoConsulta = class(TForm)
    PnTopo: TPanel;
    PnBotoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    PnCorpo: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DbGDados: TDBGrid;
    DsConsulta: TDataSource;
    BtnPesquisar: TBitBtn;
    QConsulta: TIBQuery;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoConsulta: TFPadraoConsulta;

implementation

{$R *.dfm}

procedure TFPadraoConsulta.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFPadraoConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPadraoConsulta.BtnPesquisarClick(Sender: TObject);
begin
  if not QConsulta.Active then
    QConsulta.Open;

  QConsulta.First;
  PageControl1.ActivePageIndex := 0;
  DbGDados.SetFocus;
end;

procedure TFPadraoConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    BtnCancelar.Click;
end;

end.
