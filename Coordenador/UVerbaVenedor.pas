unit UVerbaVenedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls;

type
  TFVerbaVenedor = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SbSupervisor: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbSupervisorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVerbaVenedor: TFVerbaVenedor;

implementation

uses UVerbaRepresentante_cl;

{$R *.dfm}

procedure TFVerbaVenedor.FormActivate(Sender: TObject);
begin
  inherited;
  DMVerbaRepresentante.QVerbaVendedor.Open;
end;

procedure TFVerbaVenedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVerbaRepresentante.QVerbaVendedor.Close;
end;

procedure TFVerbaVenedor.SbSupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=mrOk then
    DMVerbaRepresentante.QVerbaVendedorCod_Vendedor.Value:=DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

end.
