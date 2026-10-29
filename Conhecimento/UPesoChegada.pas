unit UPesoChegada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db;

type
  TFPesoChegada = class(TForm)
    DSRPA: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesoChegada: TFPesoChegada;

implementation

uses URPA_cl, UOracle_cl;

{$R *.DFM}

procedure TFPesoChegada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FPesoChegada := nil;
end;

procedure TFPesoChegada.FormShow(Sender: TObject);
begin
  DMRPA.QRPA.Edit;
end;

procedure TFPesoChegada.BtnOkClick(Sender: TObject);
begin
  With DMRPA do
  Begin
    If(QRPAQT_PESO_CHEGADA.IsNull)Then
    Begin
      DMRPA.QRPA.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('É necessário informar uma Quantidade');
    End;
    QRPA.Post;
    DMOracle.DBCemapa.Commit;
  End;
end;

procedure TFPesoChegada.BtnCancelClick(Sender: TObject);
begin
  DMRPA.QRPA.Cancel;
  DMOracle.DBCemapa.Rollback;
end;

end.
