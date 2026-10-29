unit UParamSistemaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls;

type
  TFParamSistemaCad = class(TForm)
    PcItens: TPageControl;
    TabSheet1: TTabSheet;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DsParamSistema: TDataSource;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParamSistemaCad: TFParamSistemaCad;

implementation

uses UDmParamSistema, UDmSistema;

{$R *.dfm}

procedure TFParamSistemaCad.FormShow(Sender: TObject);
begin
  DmParamSistema.QParamSistema.Close;
  DmParamSistema.QParamSistema.Open;

  DmSistema.TSistema.CommitRetaining;

  if DmParamSistema.QParamSistema.IsEmpty then
    DmParamSistema.QParamSistema.Append
  else
    DmParamSistema.QParamSistema.Edit;

  PcItens.ActivePageIndex := 0;
  DBEdit1.SetFocus;
end;

procedure TFParamSistemaCad.BtnGravarClick(Sender: TObject);
begin
  try
    DmParamSistema.QParamSistema.Post;
  except
    MessageDlg('Erro na gravação do registro.', mtError, [mbOK], 0);
    DmSistema.TSistema.RollbackRetaining;
    Abort;
  end;

  DmSistema.TSistema.CommitRetaining;

  BtnCancelar.Click;
end;

procedure TFParamSistemaCad.BtnCancelarClick(Sender: TObject);
begin
  if DmParamSistema.QParamSistema.State in [dsEdit, dsInsert] then
  Begin
    DmParamSistema.QParamSistema.Cancel;
    DmSistema.TSistema.RollbackRetaining;
  End;

  DmParamSistema.QParamSistema.Close;
  DmParamSistema.QParamSistema.Open;

  Close;
end;

procedure TFParamSistemaCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    BtnGravar.Click;
  if Key = VK_ESCAPE then
    BtnCancelar.Click;
end;

end.
