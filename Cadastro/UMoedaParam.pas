unit UMoedaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  UFmMoeda;

type
  TFMoedaParam = class(TFTParametro)
    TSCotacao: TTabSheet;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    Rg1Ordem: TRadioGroup;
    FmMoeda1: TFmMoeda;
    Rg1Situacao: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMoedaParam: TFMoedaParam;

implementation

uses UMoeda_cl, UMoedaCons;

{$R *.DFM}

procedure TFMoedaParam.FormCreate(Sender: TObject);
begin
  inherited;
  ME0DataF.Text := DateToStr(Date);
end;

end.
