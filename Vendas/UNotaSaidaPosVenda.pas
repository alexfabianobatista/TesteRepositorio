unit UNotaSaidaPosVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DB, DBCtrls, ComCtrls, ActnList;

type
  TFNotaSaidaPosVenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    DBEdit14: TDBEdit;
    DsPosVenda: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BtnExcluir: TBitBtn;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaPosVenda: TFNotaSaidaPosVenda;

implementation

uses UNotaSaida_cl, UOracle_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFNotaSaidaPosVenda.BtnExcluirClick(Sender: TObject);
begin
  DMNotaSaida.QPosVenda.cancel;
  if (not (DMNotaSaida.QPosVenda.IsEmpty)) then
    DMNotaSaida.QPosVenda.Delete;
  DMOracle.DBCemapa.Commit;
  DMNotaSaida.QPosVenda.Append;
  Close;
end;

procedure TFNotaSaidaPosVenda.FormActivate(Sender: TObject);
begin
  DBEdit14.SetFocus;
end;

procedure TFNotaSaidaPosVenda.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFNotaSaidaPosVenda.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
