unit USuinoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask,
  UFmCadastro, UFmFilial;

type
  TFSuinoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Fm0Cadastro: TFmCadastro;
    Me0DataIni: TMaskEdit;
    Me0DataFin: TMaskEdit;
    Fm0Filial: TFmFilial;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuinoParam: TFSuinoParam;

implementation

{$R *.dfm}

end.
