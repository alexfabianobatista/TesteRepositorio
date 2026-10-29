unit URDREParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFDREParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0CodFilial: TMaskEdit;
    ME0Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MePeriodo: TMaskEdit;
    RgTipo: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MePagina: TMaskEdit;
    BtnLimpar: TBitBtn;
    LbFiliais: TListBox;
    Label5: TLabel;
    rgSaldoAnterior: TRadioGroup;
    RGPeriodo: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure ME0CodFilialChange(Sender: TObject);
    procedure ME0CodFilialExit(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
    matrizDRE: String;
  public
    { Public declarations }
    function GeraStringsFiliais: TStrings;
    property pMatrizDRE: String read matrizDRE write matrizDRE;
  end;

var
  FDREParam: TFDREParam;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TFDREParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME0CodFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

    LbFiliais.Items.Add(Trim(ME0CodFilial.Text));
    ME0CodFilial.Clear;
    ME0Filial.Clear;
  end
  else
    ME0CodFilial.Clear;
end;

procedure TFDREParam.ME0CodFilialChange(Sender: TObject);
begin
  inherited;
  if trim(ME0CodFilial.Text) <> '' then
    ME0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + ME0Codfilial.Text)
  else
    ME0Filial.Text := 'Todos';
end;

procedure TFDREParam.ME0CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.Text) <> '' then
  begin
    LbFiliais.Items.Add(Trim(ME0CodFilial.Text));
    matrizDRE := Trim(ME0CodFilial.Text);
    ME0CodFilial.Clear;
    ME0Filial.Clear;
  end
  else
    MessageDlg('Deve ser informada a filial', mtInformation, [mbOK], 0);
end;

procedure TFDREParam.BtnLimparClick(Sender: TObject);
begin
  inherited;
  LbFiliais.Clear;
end;

function TFDREParam.GeraStringsFiliais: TStrings;
begin
  Result := LbFiliais.Items;
end;

end.

