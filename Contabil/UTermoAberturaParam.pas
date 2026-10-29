unit UTermoAberturaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmFilial,
  Mask;

type
  TFTermoAberturaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm1Filial: TFmFilial;
    Label1: TLabel;
    Label2: TLabel;
    ME1Orgao: TMaskEdit;
    ME1NumInscricao: TMaskEdit;
    Label3: TLabel;
    ME1PagFinal: TMaskEdit;
    ME1PagInicial: TMaskEdit;
    Label4: TLabel;
    ME1DataAbertura: TMaskEdit;
    Label5: TLabel;
    ME1DataFechamento: TMaskEdit;
    Label6: TLabel;
    RG1Termo: TRadioGroup;
    RG1DiarioRazao: TRadioGroup;
    Label7: TLabel;
    MEDtOrgao: TMaskEdit;
    Label8: TLabel;
    Me1NumeroOrdem: TMaskEdit;
    procedure ME1PagInicialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTermoAberturaParam: TFTermoAberturaParam;

implementation

{$R *.dfm}

procedure TFTermoAberturaParam.ME1PagInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8, #13]) then
    key := #0;
end;

end.
