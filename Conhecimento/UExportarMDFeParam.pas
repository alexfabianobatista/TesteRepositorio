unit UExportarMDFeParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UFmDatas, UFmCadastro, UFmFilial;

type
  TFExportarMDFeParam = class(TForm)
    GroupBox2: TGroupBox;
    FmFilial1: TFmFilial;
    FmDatas1: TFmDatas;
    BTExportar: TBitBtn;
    BTCancelar: TBitBtn;
    GroupBox3: TGroupBox;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    procedure BTExportarClick(Sender: TObject);
    procedure FmFilial1BtFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportarMDFeParam: TFExportarMDFeParam;

implementation

{$R *.dfm}

procedure TFExportarMDFeParam.BTExportarClick(Sender: TObject);
begin
  if Trim(FmFilial1.MeFilial.Text) = '' then
    MessageDlg('É preciso preencher a filial.', mtError, [mbOK], 0)
  else
    ModalResult := mrOk;
end;

procedure TFExportarMDFeParam.FmFilial1BtFilialClick(Sender: TObject);
begin
  FmFilial1.BtFilialClick(Sender);
end;

end.
