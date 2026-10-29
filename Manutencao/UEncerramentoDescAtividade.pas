unit UEncerramentoDescAtividade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Db;

type
  TFEncerramentoDescAtividade = class(TForm)
    EDNumOS: TEdit;
    EDDescOS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    DSOSPatrimonioItemAgenda: TDataSource;
    MEEncerramento: TMaskEdit;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEncerramentoDescAtividade: TFEncerramentoDescAtividade;

implementation

uses UOSPatrimonio_cl;

{$R *.DFM}

procedure TFEncerramentoDescAtividade.FormActivate(Sender: TObject);
begin
  with DMOSPatrimonio do
  Begin
    EDNumOS.text := IntToStr(DMOSPatrimonio.QOSPatrimonioNum_OS_CAB.value);
    EDDescOS.text:= DMOSPatrimonio.QOSPatrimonioDesc_OS_patrimonio.value;
    QOSPatrimonioItem.close;
    QOSPatrimonioItem.setvariable('NUM_OS_CAB', DMOSPatrimonio.QOSPatrimonioConsNum_OS_CAB.value);
    QOSPatrimonioItem.Open;
    MEEncerramento.text:=DateToStr(Date);
  end;
end;

procedure TFEncerramentoDescAtividade.BtOkClick(Sender: TObject);
begin
   if DSOSPatrimonioItemAgenda.state in [DSInsert, DSEdit] then
     DSOSPatrimonioItemAgenda.DataSet.post;
end;

end.
