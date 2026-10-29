unit UFmNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBGrids;

type
  TFmNota = class(TFrame)
    Nota: TLabel;
    MeNota: TMaskEdit;
    BtNota: TBitBtn;
    EdNota: TEdit;
    Label1: TLabel;
    procedure MeNotaExit(Sender: TObject);
    procedure MeNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFmNota.MeNotaExit(Sender: TObject);
var
  Buscador : TBuscador;
begin
  if Trim(MeNota.Text) <> '' then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('NUM_NOTA', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + MeNota.Text);
    Buscador.Adiciona('DT_EMISSAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + MeNota.Text);
    Buscador.Buscar;
    EdNota.Text := 'Número: ';
    EdNota.Text := EdNota.Text + Buscador.Proximo;
    EdNota.Text := EdNota.Text + ', Emissão: ';
    EdNota.Text := EdNota.Text + Buscador.Proximo;
  end
  else
    EdNota.Text := 'Todas';
end;

procedure TFmNota.MeNotaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtNota.Click;
end;

procedure TFmNota.BtNotaClick(Sender: TObject);
var
  Form: TForm;
  Err: String;
begin
  try
    if self.Tag = 0 then
      Form := TFormClass(GetClass('TFNotaEntradaCons')).Create(Application)
    else
      Form := TFormClass(GetClass('TFNotaSaidaCons')).Create(Application);
  except
    on E: Exception do
    begin
      Err := E.Message;
      Form := nil;
    end;
  end;
  if Form = nil then
  begin
    MessageDlg('Desculpe, não é possível fazer consulta desse tipo de nota deste sistema.' +
        #13 + #10 + Err, mtError, [mbOK], 0);
    Exit;
  end;
  if Form.ShowModal = MrOk then
  begin
    MeNota.Text := TDBGrid(Form.FindComponent('DBGrid1')).DataSource.DataSet.FieldByName('COD_NOTA_CAB').Text;
    MeNotaExit(Sender);
  end;
end;

end.
