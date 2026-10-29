unit UFCustoCalculoRateio;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Mask, DBCtrls;

type
  TFCustosCalculo = class(TForm)
    OKBtn: TButton;
    BtnCancelar: TButton;
    Bevel1: TBevel;
    Label2: TLabel;
    SB_FilialCons: TSpeedButton;
    EdDescFilial: TEdit;
    Label1: TLabel;
    ME_DataI: TMaskEdit;
    Label3: TLabel;
    ME_DataF: TMaskEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    EdCodFilial: TEdit;
    procedure SB_FilialConsClick(Sender: TObject);
    procedure EdCodFilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustosCalculo: TFCustosCalculo;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFCustosCalculo.SB_FilialConsClick(Sender: TObject);
begin
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    EdDescFilial.Text := DMFilial.QFilialConsDESC_FILIAL.Value;
    EdCodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFCustosCalculo.EdCodFilialExit(Sender: TObject);
begin
  if (Trim(EdCodFilial.Text) <> '') AND (CheckBox1.Checked = False) then
     EdDescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                 'COD_FILIAL = '+FCustosCalculo.EdCodFilial.Text)

  else
  begin
    EdCodFilial.Text := '';
    CheckBox1.Checked := True;
  end;

end;

end.
