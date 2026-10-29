unit UConhecimentoAduaneiroCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFConhecimentoAduaneiroCons = class(TFTConsulta)
    Label3: TLabel;
    Label11: TLabel;
    MEDTini: TMaskEdit;
    MeDtFim: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoAduaneiroCons: TFConhecimentoAduaneiroCons;

implementation

uses UConhecimento_cl, UUsuario_cl;

{$R *.dfm}

procedure TFConhecimentoAduaneiroCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QConhecimentoAduaneiroCons.Close;
    QConhecimentoAduaneiroCons.SetVariable('DT_EMISSAO_INI', MEDTini.Text);
    QConhecimentoAduaneiroCons.SetVariable('DT_EMISSAO_FIN', MeDtFim.Text);
    QConhecimentoAduaneiroCons.Open;
  end;
end;

procedure TFConhecimentoAduaneiroCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDTini.Text := DateToStr(Date);
  MeDtFim.Text := DateToStr(Date);
end;

end.
