unit URelatorioWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFRelatorioWiz = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioWiz: TFRelatorioWiz;

implementation

uses UReporter_cl, UReporterWiz;

{$R *.DFM}

procedure TFRelatorioWiz.FormActivate(Sender: TObject);
begin
  inherited;
  With DMReporter do
  Begin
    QRelatorio.Open;
  End;
end;

procedure TFRelatorioWiz.SBIncluirClick(Sender: TObject);
begin
  inherited;
  If FReporterWiz = Nil then
    FReporterWiz := TFReporterWiz.Create(Self);
  FReporterWiz.ShowModal;
end;

end.
