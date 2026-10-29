unit UMaquinaRevCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMaquinaRevCons = class(TFTConsulta)
    MEObra: TMaskEdit;
    MEFilial: TMaskEdit;
    MECadastro: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SBObra: TSpeedButton;
    SBFilial: TSpeedButton;
    SBCadastro: TSpeedButton;
    procedure SBObraClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaRevCons: TFMaquinaRevCons;

implementation

uses UMaquinaRev_cl, UObraCons, UFilialCons, UCadastroCons, UObra_cl,
  UFilial_cl, UCadastro_cl;

{$R *.DFM}

procedure TFMaquinaRevCons.SBObraClick(Sender: TObject);
begin
  inherited;
 if FObraCons  = Nil then
   FObraCons := TFObraCons.Create(Application);
 if FObraCons.ShowModal=mrOk Then
   MeObra.Text:=DMObra.QObra_ConsCod_obra.Text;

end;

procedure TFMaquinaRevCons.SBFilialClick(Sender: TObject);
begin
  inherited;
if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFMaquinaRevCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    MeCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFMaquinaRevCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMaquinaRev Do
  Begin
    QMaquinaRevCons.Close;
    If Trim(MeObra.Text) <> '' Then
       QMaquinaRevCons.SetVariable('OBRA',Trim(MeObra.Text))
    Else
      QMaquinaRevCons.SetVariable('OBRA',Null);
    If Trim(MeFilial.Text) <> '' Then
       QMaquinaRevCons.SetVariable('FILIAL',Trim(MeFilial.Text))
    Else
      QMaquinaRevCons.SetVariable('FILIAL',Null);
    If Trim(MeCadastro.Text) <> '' Then
       QMaquinaRevCons.SetVariable('CADASTRO',MeCadastro.Text)
    Else
       QMaquinaRevCons.SetVariable('CADASTRO',Null);
    If Trim(MeTexto.Text) <> '' Then
       QMaquinaRevCons.SetVariable('DT_REVISAO',MeTexto.Text)
    Else
       QMaquinaRevCons.SetVariable('DT_REVISAO',Null);
    QMaquinaRevCons.Open;

end;
end;
end.
