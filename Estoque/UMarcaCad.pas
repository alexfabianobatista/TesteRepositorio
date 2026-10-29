unit UMarcaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFMarca_Cad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RelMarcas1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    LblDescMotor: TLabel;
    DBEDescMotor: TDBEdit;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelMarcas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarca_Cad: TFMarca_Cad;

implementation

uses UMarca_cl, UMarcaCons, URMarca, UParamSistema_cl;

{$R *.DFM}

procedure TFMarca_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
{if DSPrimario.State in [DsEdit,DsInsert] then
    begin
      SBMarca.Enabled:=True;  
    end
  else
    begin
      SBMarca.Enabled:=False;
    end;   }
end;

procedure TFMarca_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMarca.QMarca.Open;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INJEPAR' then
  begin
    LblDescMotor.Visible := False;
    DBEDescMotor.Visible := False;
  end;
end;

procedure TFMarca_Cad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMMarca.QMarca.Close;
  Action := CaFree;
  FMarca_Cad := Nil;
end;

procedure TFMarca_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMarca_Cons = Nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  If FMarca_Cons.ShowModal = mrOk then
  with DMMarca do
  begin
    QMarca.Close;
    QMarca.SetVariable('PK',QMarcaConsCod_Marca.Value);
    QMarca.Open;
  end;   
end;

procedure TFMarca_Cad.RelMarcas1Click(Sender: TObject);
begin
  inherited;
      If FRMarca = Nil then
        FRMarca:=TFRMarca.Create(Application);
      With DMMarca do
        Begin
          QRMarca.Close;
          QRMarca.Open;
        end;
      FRMarca.QRPrimario.Preview;
      DMMarca.QRMarca.Close;                  
end;

end.
