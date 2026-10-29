unit UFmManifesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBGrids;

type
  TFmManifesto = class(TFrame)
    Manifesto: TLabel;
    MeManifesto: TMaskEdit;
    BtManifesto: TBitBtn;
    EdManifesto: TEdit;
    Label1: TLabel;
    procedure MeManifestoExit(Sender: TObject);
    procedure MeManifestoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtManifestoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFmManifesto.MeManifestoExit(Sender: TObject);
var
  Buscador : TBuscador;
begin
  if Trim(MeManifesto.Text) <> '' then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('NUM_MANIFESTO', 'TB_MANIFESTO', 'COD_MANIFESTO = ' + MeManifesto.Text);
    Buscador.Adiciona('DT_EMISSAO', 'TB_Manifesto', 'COD_Manifesto = ' + MeManifesto.Text);
    Buscador.Buscar;
    EdManifesto.Text := 'Número: ';
    EdManifesto.Text := EdManifesto.Text + Buscador.Proximo;
    EdManifesto.Text := EdManifesto.Text + ', Emissão: ';
    EdManifesto.Text := EdManifesto.Text + Buscador.Proximo;
  end
  else
    EdManifesto.Text := 'Todos';
end;

procedure TFmManifesto.MeManifestoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtManifesto.Click;
end;

procedure TFmManifesto.BtManifestoClick(Sender: TObject);
var
  Form: TForm;
  Err: String;
begin
  try
    Form := TFormClass(GetClass('TFManifestoCons')).Create(Application);
  except
    on E: Exception do
    begin
      Err := E.Message;
      Form := nil;
    end;
  end;
  if Form = nil then
  begin
    MessageDlg('Desculpe, não é possível fazer consulta desse tipo de Manifesto deste sistema.' +
        #13 + #10 + Err, mtError, [mbOK], 0);
    Exit;
  end;
  if Form.ShowModal = MrOk then
  begin
    MeManifesto.Text := TDBGrid(Form.FindComponent('DBGrid1')).DataSource.DataSet.FieldByName('COD_Manifesto').Text;
    MeManifestoExit(Sender);
  end;
end;

end.
