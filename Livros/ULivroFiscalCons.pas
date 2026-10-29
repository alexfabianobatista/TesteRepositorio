unit ULivroFiscalCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFLivroFiscalCons = class(TFTConsulta)
    Label2: TLabel;
    MEAno: TMaskEdit;
    Label3: TLabel;
    MEMes: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivroFiscalCons: TFLivroFiscalCons;

implementation

uses ULivroFiscal_Cl, UUsuario_cl;

{$R *.DFM}

procedure TFLivroFiscalCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'LIVRO FISCAL');
  With DMLivroFiscal do
  Begin
    QLivroFiscalCons.Close;
    If Trim(METexto.Text) <> '' Then
      QLivroFiscalCons.SetVariable('FILIAL',METexto.Text)
    Else
      QLivroFiscalCons.SetVariable('FILIAL',Null);
    If Trim(MEAno.Text) <> '' Then
      QLivroFiscalCons.SetVariable('ANO',MEAno.Text)
    Else
      QLivroFiscalCons.SetVariable('ANO',Null);
    If Trim(MEMes.Text) <> '' Then
      QLivroFiscalCons.SetVariable('MES',MEMes.Text)
    Else
      QLivroFiscalCons.SetVariable('MES',Null);
    QLivroFiscalCons.Open;
  End;
end;

end.
