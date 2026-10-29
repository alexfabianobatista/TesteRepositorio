unit UExameFuncionarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFExameFuncionarioCad = class(TForm)
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BTExameCons: TBitBtn;
    BTTipoExameCons: TBitBtn;
    Label1: TLabel;
    DBEdit8: TDBEdit;
    procedure BTTipoExameConsClick(Sender: TObject);
    procedure BTExameConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExameFuncionarioCad: TFExameFuncionarioCad;

implementation

uses UExameFuncionario_cl, UTipoExameCons, UTipoExame_cl, UExameCons,
  UExame_cl;

{$R *.DFM}

procedure TFExameFuncionarioCad.BTTipoExameConsClick(Sender: TObject);
begin
  if FTipoExameCons = nil then
     FTipoExameCons := TFTipoExameCons.create(application);
  if FTipoExameCons.showmodal = mrOk then
  begin
    with DMExameFuncionario do
    begin
      QExameFuncionarioCod_Tipo_Exame.Value := DMTipoExame.QTipoExameConsCod_Tipo_Exame.Value;
    end;
  end;
end;

procedure TFExameFuncionarioCad.BTExameConsClick(Sender: TObject);
begin
  if FExameCons = nil then
     FExameCons := TFExameCons.create(application);
  if FExameCons.showmodal = mrOk then
  begin
    with DMExameFuncionario do
    begin
      QExameFuncionarioCod_Exame.Value := DMExame.QExameConsCod_Exame.Value;
    end;
  end;
end;

end.
