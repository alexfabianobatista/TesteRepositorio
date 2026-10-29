unit UExportarCTeParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UFmDatas, UFmCadastro, UFmFilial;

type
  TFExportarCTeParam = class(TForm)
    GroupBox2: TGroupBox;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    FmDatas1: TFmDatas;
    BTExportar: TBitBtn;
    BTCancelar: TBitBtn;
    GroupBox3: TGroupBox;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    FmCadastro2: TFmCadastro;
    CBCancelado: TCheckBox;
    procedure BTExportarClick(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure FmFilial1BtFilialClick(Sender: TObject);
    procedure FmCadastro2BtCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportarCTeParam: TFExportarCTeParam;

implementation

{$R *.dfm}

procedure TFExportarCTeParam.BTExportarClick(Sender: TObject);
begin
  if Trim(FmFilial1.MeFilial.Text) = '' then
    MessageDlg('É preciso preencher a filial.', mtError, [mbOK], 0)
  else
    ModalResult := mrOk;
end;

procedure TFExportarCTeParam.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  FmCadastro1.BtCadastroClick(Sender);
end;

procedure TFExportarCTeParam.FmFilial1BtFilialClick(Sender: TObject);
begin
  FmFilial1.BtFilialClick(Sender);
end;

procedure TFExportarCTeParam.FmCadastro2BtCadastroClick(Sender: TObject);
begin
  FmCadastro2.BtCadastroClick(Sender);
end;

end.
