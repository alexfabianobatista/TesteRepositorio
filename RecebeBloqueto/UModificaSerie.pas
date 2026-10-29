unit UModificaSerie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db;

type
  TFModificaSerie = class(TForm)
    DSConta: TDataSource;
    DBEdit1: TDBEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EdValSerie: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModificaSerie: TFModificaSerie;

implementation

uses UConta_cl, UAcesso_cl;

{$R *.DFM}

procedure TFModificaSerie.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FModificaSerie := nil;
end;

procedure TFModificaSerie.BtOkClick(Sender: TObject);
begin
  If(EdValSerie.Text <> '')Then
  Begin
    DMAcesso.ExecutaSql('UPDATE TB_CONTA SET VAL_SERIE_ARQUIVO = ' + EdValSerie.Text +
                        ' WHERE COD_CONTA = ' + DMConta.QContaCOD_CONTA.Text);
    DMConta.QConta.Close;
    DMConta.QConta.Open;
    EdValSerie.Clear;
  End
  Else
    raise Exception.Create('É necessário informar um valor para se modificar a série');
end;

end.
