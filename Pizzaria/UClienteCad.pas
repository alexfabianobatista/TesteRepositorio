unit UClienteCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFClienteCad = class(TFPadrao)
    TBCOD_CLIENTE: TIntegerField;
    TBDESC_NOME: TIBStringField;
    TBDESC_TELEFONE: TIBStringField;
    TBDESC_ENDERECO: TIBStringField;
    TBDESC_LOCALIZACAO: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DbEFoco: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCad: TFClienteCad;

implementation

uses UDmCliente;

{$R *.dfm}

procedure TFClienteCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'COD_CLIENTE';
//  CampoFoco := 1;
end;

procedure TFClienteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmCliente.QSelCliente.Active then
  Begin
    DmCliente.QSelCliente.Close;
    DmCliente.QSelCliente.Open;
  End;
end;

procedure TFClienteCad.TGravarClick(Sender: TObject);
begin
  if TBDESC_NOME.Value = '' then
  Begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    DbEFoco.SetFocus;
    Exit;
  End;

  if TBDESC_TELEFONE.Value = '' then
  Begin
    MessageDlg('Informe o Telefone.', mtWarning, [mbOK], 0);
    DBEdit3.SetFocus;
    Exit;
  End;

  inherited;

end;

end.
