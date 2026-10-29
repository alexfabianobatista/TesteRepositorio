unit URequisicaoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  UFmProduto, UFmFilial;

type
  TFRequisicaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmProduto1: TFmProduto;
    FmDatas1: TFmDatas;
    FmFilial1: TFmFilial;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoParam: TFRequisicaoParam;

implementation

{$R *.dfm}

procedure TFRequisicaoParam.FormCreate(Sender: TObject);
begin
  inherited;
  FMDatas1.MeDtInicial.Text := DateToStr(Date - 30);
  FMDatas1.MeDtFinal.Text := DateToStr(Date);
end;

end.
