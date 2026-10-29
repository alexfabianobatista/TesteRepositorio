unit UIRFCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFBaseCalcIRFCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBGListaBase: TDBGrid;
    Bevel1: TBevel;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBRGOpcoes: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure DBGListaBaseCellClick(Column: TColumn);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBRGOpcoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseCalcIRFCad: TFBaseCalcIRFCad;

implementation

uses UBaseCalculoIRF_cl;

{$R *.DFM}

procedure TFBaseCalcIRFCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMIRF Do
  begin
    QBaseCalcIRF.Open;
    QListaBaseCalc.Open;
    SBConsulta.enabled:=false;
    SBConsulta.Visible:=false;
  end;
end;

procedure TFBaseCalcIRFCad.DBGListaBaseCellClick(Column: TColumn);
begin
  inherited;
  with DMIRF do
  begin
    QBaseCalcIRF.close;
    QBaseCalcIRF.setVariable('Cod_Base_calc',QlistaBaseCalcCOD_BASE_CALC.Value);
    QBaseCalcIRF.Open;
  end;
end;

procedure TFBaseCalcIRFCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if not(DSPrimario.State in [DSInsert, DSEdit]) then
  begin
    DBEdit1.Enabled:=false;
    DBEdit2.Enabled:=false;
    DBEdit3.Enabled:=false;
    DBEdit4.Enabled:=false;
    DBEdit5.Enabled:=false;

    DBEdit1.Color:=clbtnface;
    DBEdit2.Color:=clbtnface;
    DBEdit3.Color:=clbtnface;
    DBEdit4.Color:=clbtnface;
    DBEdit5.Color:=clbtnface;

    DBRGOpcoes.Enabled:=true;
  end;

end;

procedure TFBaseCalcIRFCad.DBRGOpcoesClick(Sender: TObject);
begin
  inherited;
  case DBRGOpcoes.ItemIndex of
  0: begin
       DBEdit1.Enabled:=true;
       DBEdit2.Enabled:=true;
       DBEdit3.Enabled:=true;
       DBEdit4.Enabled:=true;

       DBEdit1.Color:=clwindow;
       DBEdit2.Color:=clwindow;
       DBEdit3.Color:=clwindow;
       DBEdit4.Color:=clwindow;

    end;
  1: begin
       DBEdit1.Enabled:=true;
       DBEdit2.Enabled:=true;
       DBEdit3.Enabled:=true;
       DBEdit4.Enabled:=true;
       DBEdit5.Enabled:=true;

       DBEdit1.Color:=clwindow;
       DBEdit2.Color:=clwindow;
       DBEdit3.Color:=clwindow;
       DBEdit4.Color:=clwindow;
       DBEdit5.Color:=clwindow;
     end;
  2: begin
       DBEdit1.Enabled:=true;
       DBEdit3.Enabled:=true;
       DBEdit4.Enabled:=true;
       DBEdit5.Enabled:=true;

       DBEdit1.Color:=clwindow;
       DBEdit3.Color:=clwindow;
       DBEdit4.Color:=clwindow;
       DBEdit5.Color:=clwindow;
     end;
  end;
  DBRGOpcoes.Enabled:=False;
end;

procedure TFBaseCalcIRFCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMIRF do
  begin
    QBaseCalcIRF.Close;
    QlistaBaseCalc.Close;
  end;
  action := cafree;
  FBaseCalcIRFCad :=nil;
end;

procedure TFBaseCalcIRFCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMIRF.QBaseCalcIRF;
end;

end.
