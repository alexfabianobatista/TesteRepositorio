unit UFuncaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFFuncaoCons = class(TFTConsulta)
    METela: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure METelaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncaoCons: TFFuncaoCons;

implementation

uses UFuncao_cl;

{$R *.dfm}

procedure TFFuncaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMFuncao do
  begin
    QFuncaoCons.Close;
    QFuncaoCons.SetVariable('NOME_FUNCAO', trim(METexto.Text));
    QFuncaoCons.SetVariable('NOME_TELA', trim(METela.Text));
    QFuncaoCons.Open;
  end;
end;

procedure TFFuncaoCons.METextoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFFuncaoCons.METelaChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

end.
