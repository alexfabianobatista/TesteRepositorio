unit UApoliceCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFApoliceCons = class(TFTConsulta)
    Label2: TLabel;
    MESeguradora: TMaskEdit;
    Label3: TLabel;
    MECorretora: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApoliceCons: TFApoliceCons;

implementation

uses UApolice_cl;

{$R *.DFM}

procedure TFApoliceCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMApolice.QApoliceCons.Close;

  If Trim(METexto.Text) <> '' Then
    DMApolice.QApoliceCons.SetVariable('NUM_APOLICE', Trim(METexto.Text) )
  Else
    DMApolice.QApoliceCons.SetVariable('NUM_APOLICE', null);

  If Trim(MESeguradora.Text) <> '' Then
    DMApolice.QApoliceCons.SetVariable('DESC_SEGURADORA', Trim(MESeguradora.Text) )
  Else
    DMApolice.QApoliceCons.SetVariable('DESC_SEGURADORA', null);

  If Trim(MECorretora.Text) <> '' Then
    DMApolice.QApoliceCons.SetVariable('DESC_CORRETORA', Trim(MECorretora.Text) )
  Else
    DMApolice.QApoliceCons.SetVariable('DESC_CORRETORA', null);
    
  DMApolice.QApoliceCons.Open;
end;

end.
