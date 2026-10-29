unit UNbsCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls;

type
  TFNbsCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNbsCad: TFNbsCad;

implementation

uses UNBS_cl, UFNBS_Cons;

{$R *.dfm}

procedure TFNbsCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMNbs do
    QNBS_Cad.Open;
end;

procedure TFNbsCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNBS_Cons = nil then
   FNBS_Cons := TFNBS_Cons.Create(Application);
  if FNBS_Cons.ShowModal = MrOk then
  begin
    with DMNbs do
    begin
      QNBS_Cad.Close;
      QNBS_Cad.SetVariable('PK',QNBS_ConsCOD_NBS.Text);
      QNBS_Cad.Open;
    end;
  end;
end;

end.
