unit UGiaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFGiaCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    MEAno: TMaskEdit;
    MEMes: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGiaCons: TFGiaCons;

implementation

uses UGia_cl, UUsuario_cl;

{$R *.DFM}

procedure TFGiaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'LIVRO FISCAL');
  With DMGia do
  Begin
    QGiaCons.Close;
    If Trim(METexto.Text) <> '' Then
      QGiaCons.SetVariable('FILIAL',METexto.Text)
    Else
      QGiaCons.SetVariable('FILIAL',Null);
    If Trim(MEAno.Text) <> '' Then
      QGiaCons.SetVariable('ANO',MEAno.Text)
    Else
      QGiaCons.SetVariable('ANO',Null);
    If Trim(MEMes.Text) <> '' Then
      QGiaCons.SetVariable('MES',MEMes.Text)
    Else
      QGiaCons.SetVariable('MES',Null);
    QGiaCons.Open;
  End;
end;

procedure TFGiaCons.FormCreate(Sender: TObject);
begin
  inherited;
//  METexto.Text := FloatToSTr(DMUsuario.CodUsuarioCorrente);
end;

end.
