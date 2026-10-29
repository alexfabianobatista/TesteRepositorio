unit UObraCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants, Menus,
  ExtCtrls, ActnList, ComCtrls;

type
  TFObraCons = class(TFTConsulta)
    BtCadastro: TSpeedButton;
    Label2: TLabel;
    MeDtInicio: TMaskEdit;
    Label3: TLabel;
    MeDtFinal: TMaskEdit;
    Label4: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TSpeedButton;
    RgSituacao: TRadioGroup;
    StatusBar1: TStatusBar;
    Label5: TLabel;
    MeDescricao: TMaskEdit;
    procedure BtCadastroClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraCons: TFObraCons;

implementation

uses UCadastroCons, UFilialCons, UCadastro_cl, UFilial_cl, UObra_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFObraCons.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    MeTexto.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFObraCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFObraCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMObra Do
  Begin
    QObra_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QObra_Cons.SetVariable('Cod_Cadastro',Trim(MeTexto.Text))
    Else
      QObra_Cons.SetVariable('Cod_Cadastro',Null);
    If Trim(MeFilial.Text) <> '' Then
       QObra_Cons.SetVariable('Cod_Filial',Trim(MeFilial.Text))
    Else
      QObra_Cons.SetVariable('Cod_Filial',Null);
    If Trim(MeDescricao.Text) <> '' Then
       QObra_Cons.SetVariable('Desc_Obra',Trim(MeDescricao.Text))
    Else
      QObra_Cons.SetVariable('Desc_Obra',Null);
    If Trim(MeDtInicio.Text) <> '' Then
       QObra_Cons.SetVariable('Dt_Inicio',MeDtInicio.Text)
    Else
       QObra_Cons.SetVariable('Dt_Inicio',Null);
    If Trim(MeDtFinal.Text) <> '' Then
       QObra_Cons.SetVariable('Dt_Fim',MeDtFinal.Text)
    Else
       QObra_Cons.SetVariable('Dt_Fim',Null);
    Case RgSituacao.ItemIndex of
      0 : QObra_Cons.SetVariable('Ind_Situacao','A');
      1 : QObra_Cons.SetVariable('Ind_Situacao','F');
      2 : QObra_Cons.SetVariable('Ind_Situacao','C');
      3 : QObra_Cons.SetVariable('Ind_Situacao',Null);
    End;
    QObra_Cons.Open;
  End;
end;

procedure TFObraCons.FormActivate(Sender: TObject);
begin
  inherited;
//  MeDtInicio.Text := DateToStr(Date);
//  MeDtFinal.Text := DateToStr(Date);
end;

procedure TFObraCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
  MeDtInicio.Text := DateToStr(Date-30);
  MeDtFinal.Text := DateToStr(Date);

end;

end.
