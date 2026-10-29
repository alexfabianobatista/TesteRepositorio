unit UMaquinaManuCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMaquinaManuCons = class(TFTConsulta)
    SBObra: TSpeedButton;
    MEFilial: TMaskEdit;
    Label2: TLabel;
    SBFilial: TSpeedButton;
    MEDt_Revisao: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    CBTipo: TComboBox;
    procedure SBObraClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaManuCons: TFMaquinaManuCons;

implementation

uses UObraCons, UCadastroCons, UFilialCons, UMaquinaManu_cl, UObra_cl,
  UCadastro_cl, UFilial_cl;

{$R *.DFM}

procedure TFMaquinaManuCons.SBObraClick(Sender: TObject);
begin
  inherited;
 if FObraCons  = Nil then
   FObraCons := TFObraCons.Create(Application);
 if FObraCons.ShowModal=mrOk Then
   MeTexto.Text:=DMObra.QObra_ConsCod_obra.Text;
end;

procedure TFMaquinaManuCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFMaquinaManuCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMaquinaManu Do
  Begin
    QMaquinaManuCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QMaquinaManuCons.SetVariable('OBRA',Trim(MeTexto.Text))
    Else
      QMaquinaManuCons.SetVariable('OBRA',Null);
    If Trim(MeFilial.Text) <> '' Then
       QMaquinaManuCons.SetVariable('FILIAL',Trim(MeFilial.Text))
    Else
      QMaquinaManuCons.SetVariable('FILIAL',Null);
    If Trim(CBTipo.Text) <> 'TODOS' Then
       QMaquinaManuCons.SetVariable('IND_TIPO',CBTipo.Text)
    Else
       QMaquinaManuCons.SetVariable('IND_TIPO',Null);
    If Trim(MeDt_Revisao.Text) <> '' Then
       QMaquinaManuCons.SetVariable('DT_REVISAO',MeDt_Revisao.Text)
    Else
       QMaquinaManuCons.SetVariable('DT_REVISAO',Null);
    QMaquinaManuCons.Open;
  end;
end;

end.
