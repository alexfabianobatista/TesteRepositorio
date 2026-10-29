unit UMensagemEletronicaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, UBiblioteca;

type
  TFMensagemEletronicaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemEletronicaCons: TFMensagemEletronicaCons;

implementation

uses UMalaDireta_cl;

{$R *.dfm}

procedure TFMensagemEletronicaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMMalaDireta do
  begin
    QMensagemEletronicaCons.Close;
    Bib.setVariableOuNull(QMensagemEletronicaCons, 'DESC_DESCRICAO', Trim(METexto.Text + '%'));
    QMensagemEletronicaCons.Open;
  end;
end;

end.
