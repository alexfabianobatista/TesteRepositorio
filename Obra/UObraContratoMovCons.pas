unit UObraContratoMovCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants;

type
  TFObraContratoMovCons = class(TFTConsulta)
    MECadastro: TMaskEdit;
    Label2: TLabel;
    BtCadastro: TSpeedButton;
    BtObra: TSpeedButton;
    procedure BtCadastroClick(Sender: TObject);
    procedure BtObraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraContratoMovCons: TFObraContratoMovCons;

implementation

uses UObraContrato_cl, UCadastroCons, UCadastro_cl, UObraContrato_Cons;

{$R *.DFM}

procedure TFObraContratoMovCons.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    MeCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFObraContratoMovCons.BtObraClick(Sender: TObject);
begin
  inherited;
  if FObraContrato_Cons  = Nil then
     FObraContrato_Cons := TFObraContrato_Cons.Create(Application);
  if FObraContrato_Cons.ShowModal=mrOk Then
    MeTexto.Text:=DMObraContrato.QObraContrato_ConsCOD_OBRA_CONTRATO.Text;
end;

procedure TFObraContratoMovCons.FormActivate(Sender: TObject);
begin
  inherited;
  METexto.Text :='';
end;

procedure TFObraContratoMovCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMObraContrato Do
  Begin
    QObraContratoMovCons.Close;
    If Trim(MeCadastro.Text) <> '' Then
       QObraContratoMovCons.SetVariable('Cod_Cadastro',Trim(MECadastro.Text))
    Else
      QObraContratoMovCons.SetVariable('Cod_Cadastro',Null);
    If Trim(MeTexto.Text) <> '' Then
       QObraContratoMovCons.SetVariable('COD_OBRA_CONTRATO',MeTexto.Text)
    Else
       QObraContratoMovCons.SetVariable('COD_OBRA_CONTRATO',Null);
    QObraContratoMovCons.Open;
  End;
end;

end.
