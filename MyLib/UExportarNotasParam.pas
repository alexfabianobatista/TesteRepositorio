unit UExportarNotasParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, UFmCadastro, UFmFilial, Buttons, UFmDatas,
  ExtCtrls, ComCtrls, ActnList;

type
  TFExportarNotasParam = class(TForm)
    GroupBox2: TGroupBox;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    GroupBox3: TGroupBox;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    BTExportar: TBitBtn;
    BTCancelar: TBitBtn;
    FmDatas1: TFmDatas;
    GbTipoNota: TGroupBox;
    ChkEntrada: TCheckBox;
    ChkSaida: TCheckBox;
    RDGTipoDoc: TRadioGroup;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure FmFilial1BtFilialClick(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure BTExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportarNotasParam: TFExportarNotasParam;

implementation

uses UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFExportarNotasParam.FmFilial1BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial1.BtFilialClick(Sender);

end;

procedure TFExportarNotasParam.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmCadastro1.BtCadastroClick(Sender);

end;

procedure TFExportarNotasParam.BTExportarClick(Sender: TObject);
begin
  if Trim(FmFilial1.MeFilial.Text) = '' then
    MessageDlg('É preciso preencher a filial.', mtError, [mbOK], 0)
  else
    ModalResult := mrOk;
end;

procedure TFExportarNotasParam.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFExportarNotasParam.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
