unit URegEntradaIPIParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFRegEntradaIPIParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Me0CodFilial: TMaskEdit;
    Bt0FilialCons: TBitBtn;
    Ed0DescFilial: TEdit;
    Label7: TLabel;
    Me0NatOperacao: TMaskEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Me0DtInicial: TMaskEdit;
    Me0DtFinal: TMaskEdit;
    RGTipo: TRadioGroup;
    procedure Me0CodFilialExit(Sender: TObject);
    procedure Bt0FilialConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegEntradaIPIParam: TFRegEntradaIPIParam;

implementation

uses UFilial_cl, UFilialCons;

{$R *.dfm}

procedure TFRegEntradaIPIParam.Me0CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0CodFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0CodFilial.Text);
    QFilial.Open;
    Ed0DescFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0DescFilial.Text := 'Todos';
end;

procedure TFRegEntradaIPIParam.Bt0FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0CodFilialExit(Self);
  End;
end;

end.
