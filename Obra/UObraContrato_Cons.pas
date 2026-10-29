unit UObraContrato_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants, Menus;

type
  TFObraContrato_Cons = class(TFTConsulta)
    Label2: TLabel;
    MeCadastro: TMaskEdit;
    Label3: TLabel;
    MeObra: TMaskEdit;
    BtFilial: TSpeedButton;
    BtCadastro: TSpeedButton;
    BtObra: TSpeedButton;
    MeDtInicio: TMaskEdit;
    Label4: TLabel;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure BtObraClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraContrato_Cons: TFObraContrato_Cons;

implementation

uses UObraContrato_cl, UFilialCons, UCadastroCons, UObraCons, UFilial_cl,
  UCadastro_cl, UObra_cl;

{$R *.DFM}

procedure TFObraContrato_Cons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    MeTexto.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFObraContrato_Cons.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    MeCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFObraContrato_Cons.BtObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal=mrOk Then
    MeObra.Text:=DMObra.QObra_ConsCod_Obra.Text;

end;

procedure TFObraContrato_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DmObraContrato do
  Begin
    QObraContrato_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QObraContrato_Cons.SetVariable('COD_FILIAL',Trim(MeTexto.Text))
    Else
       QObraContrato_Cons.SetVariable('COD_FILIAL',Null);
    If Trim(MeCadastro.Text) <> '' Then
       QObraContrato_Cons.SetVariable('COD_CADASTRO',Trim(MeCadastro.Text))
    Else
       QObraContrato_Cons.SetVariable('COD_CADASTRO',Null);
    If Trim(MeObra.Text) <> '' Then
       QObraContrato_Cons.SetVariable('COD_OBRA',Trim(MeObra.Text))
    Else
       QObraContrato_Cons.SetVariable('COD_OBRA',Null);
    If Trim(MeDtInicio.Text) <> '' Then
       QObraContrato_Cons.SetVariable('DT_INICIO',Trim(MeDtInicio.Text))
    Else
       QObraContrato_Cons.SetVariable('DT_INICIO',Null);
    QObraContrato_Cons.Open;
  End;
end;

procedure TFObraContrato_Cons.FormCreate(Sender: TObject);
begin
  inherited;
  MeDtInicio.Text := DateToStr(Date-30);
end;

end.
