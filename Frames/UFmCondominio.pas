unit UFmCondominio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmCondominio = class(TFrame)
    Label1: TLabel;
    MeCondominio: TMaskEdit;
    BtCondominio: TBitBtn;
    EdCondominio: TEdit;
    procedure MeCondominioExit(Sender: TObject);
    procedure BtCondominioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UCondominio_Cons, UImobiliaria_cl;

{$R *.dfm}

procedure TFmCondominio.MeCondominioExit(Sender: TObject);
begin
  if trim(MECondominio.Text) <> '' then
    EDCondominio.Text := DMOracle.BuscaNome('SELECT DESC_CONDOMINIO FROM TB_CONDOMINIO','COD_CONDOMINIO = ' +
                           MeCondominio.Text, true)
  else
    EDCondominio.Text := 'Todos';

end;

procedure TFmCondominio.BtCondominioClick(Sender: TObject);
begin
  if FCondominio_Cons = Nil then
    FCondominio_Cons := TFCondominio_Cons.Create(Application);
  if FCondominio_Cons.ShowModal = MrOk then
    MeCondominio.Text := DMImobiliaria.QCondominio_ConsCOD_CONDOMINIO.Text;
  MeCondominioExit(Self);

end;

end.
