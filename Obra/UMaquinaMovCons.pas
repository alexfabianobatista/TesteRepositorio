unit UMaquinaMovCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMaquinaMovCons = class(TFTConsulta)
    MEOperador: TMaskEdit;
    MEDt_Movimento: TMaskEdit;
    MEFilial: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtObra: TSpeedButton;
    BtOperador: TSpeedButton;
    BtFilial: TSpeedButton;
    procedure BtObraClick(Sender: TObject);
    procedure BtOperadorClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaMovCons: TFMaquinaMovCons;

implementation

uses UMaquinaMov_cl, UObraCons, UObra_cl, UFilialCons, UFilial_cl,
  UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFMaquinaMovCons.BtObraClick(Sender: TObject);
begin
  inherited;
 if FObraCons  = Nil then
   FObraCons := TFObraCons.Create(Application);
 if FObraCons.ShowModal=mrOk Then
   MeTexto.Text:=DMObra.QObra_ConsCod_obra.Text;
end;

procedure TFMaquinaMovCons.BtOperadorClick(Sender: TObject);
begin
  inherited;
 if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.create(Application);
 if FCadastroCons.ShowModal=mrOk then
    MeOperador.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFMaquinaMovCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFMaquinaMovCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMaquinaMov Do
  Begin
    QMaquinaMovCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QMaquinaMovCons.SetVariable('OBRA',Trim(MeTexto.Text))
    Else
      QMaquinaMovCons.SetVariable('OBRA',Null);
    If Trim(MeFilial.Text) <> '' Then
       QMaquinaMovCons.SetVariable('FILIAL',Trim(MeFilial.Text))
    Else
      QMaquinaMovCons.SetVariable('FILIAL',Null);
    If Trim(MeOperador.Text) <> '' Then
       QMaquinaMovCons.SetVariable('OPERADOR',MeOperador.Text)
    Else
       QMaquinaMovCons.SetVariable('OPERADOR',Null);
    If Trim(MeDt_Movimento.Text) <> '' Then
       QMaquinaMovCons.SetVariable('DT_MOVIMENTO',MeDt_Movimento.Text)
    Else
       QMaquinaMovCons.SetVariable('DT_MOVIMENTO',Null);
    QMaquinaMovCons.Open;
  End;
end;

end.
