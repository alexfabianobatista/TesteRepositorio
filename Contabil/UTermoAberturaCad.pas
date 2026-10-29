unit UTermoAberturaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFTermoAberturaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtConsFilial: TBitBtn;
    DBDirceu1: TDBDirceu;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    EmissaoTermoAberturaFechamentoDirio1: TMenuItem;
    procedure BtConsFilialClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissaoTermoAberturaFechamentoDirio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTermoAberturaCad: TFTermoAberturaCad;

implementation

uses UFilialCons, UFilial_cl, UTermoAbertura_cl, UTermoAberturaCons,
  UTermoAberturaParam, URTermoDiario, UBiblioteca;

{$R *.dfm}

procedure TFTermoAberturaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMTermoAbertura.QTermoAberturaCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFTermoAberturaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) then
  begin
    BtConsFilial.Enabled := True;
  end
  else
  begin
    BtConsFilial.Enabled := False;
  end;
end;

procedure TFTermoAberturaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTermoAbertura.QTermoAbertura.Close;
  DMTermoAbertura.QTermoAbertura.Open;
end;

procedure TFTermoAberturaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FTermoAberturaCons = Nil  then
    FTermoAberturaCons := TFTermoAberturaCons.Create(Application);
  if FTermoAberturaCons.ShowModal = MrOk then
    with DMTermoAbertura do
    begin
      QTermoAbertura.Close;
      QTermoAbertura.SetVariable('PK', QTermoAberturaConsCOD_TERMO_ABERTURA.Value);
      QTermoAbertura.Open;
    end;
end;

procedure TFTermoAberturaCad.EmissaoTermoAberturaFechamentoDirio1Click(
  Sender: TObject);
var
  dia: TDate;
begin
  inherited;
  if FTermoAberturaParam = nil then
    FTermoAberturaParam := TFTermoAberturaParam.Create(Application);
  FTermoAberturaParam.PGRelatorio.Pages[0].TabVisible := True;
  FTermoAberturaParam.Me1NumeroOrdem.Text := DMTermoAbertura.QTermoAberturaNUM_ORDEM.Text;
  if FTermoAberturaParam.ShowModal = MrOk then
    with DMTermoAbertura do
    begin
      QRTermo.Close;
      QRTermo.SetVariable('FILIAL', FTermoAberturaParam.Fm1Filial.MeFilial.Text);
      QRTermo.SetVariable('DT_ABERTURA', StrToDate(FTermoAberturaParam.ME1DataAbertura.Text));
      QRTermo.SetVariable('DT_FECHAMENTO', StrToDate(FTermoAberturaParam.ME1DataFechamento.Text));
      QRTermo.SetVariable('PAGINA_I', FTermoAberturaParam.ME1PagInicial.Text);
      QRTermo.SetVariable('PAGINA_F', FTermoAberturaParam.ME1PagFinal.Text);
      QRTermo.SetVariable('NUM_ORDEM', FTermoAberturaParam.Me1NumeroOrdem.Text);
      case FTermoAberturaParam.RG1Termo.ItemIndex of
        0: QRTermo.SetVariable('TIPO', 'ABERTURA');
        1: QRTermo.SetVariable('TIPO', 'FECHAMENTO');
        2: QRTermo.SetVariable('TIPO', null);
      end;
      if FTermoAberturaParam.RG1DiarioRazao.ItemIndex = 0 then
        QRTermo.SetVariable('DIARIO_RAZAO', 'DIARIO')
      else
        QRTermo.SetVariable('DIARIO_RAZAO', 'RAZAO');
      QRTermo.Open;

      if FRTermoDiario = nil then
        FRTermoDiario := TFRTermoDiario.Create(Application);
      FRTermoDiario.QRLOrgao.Caption := FTermoAberturaParam.ME1Orgao.Text;
      dia := StrToDate(FTermoAberturaParam.MEDtOrgao.Text);
      FRTermoDiario.QRLNumInscricao.Caption := FTermoAberturaParam.ME1NumInscricao.Text +
          ', em ' + FormatDateTime('dd', dia) + ' de ' + Bib.NomeMes(StrToInt(FormatDateTime('MM', dia))) +
          ' de ' + FormatDateTime('yyyy', dia);

      if FTermoAberturaParam.RGPreview.ItemIndex = 0 then
        FRTermoDiario.QRPrimario.Preview
      else
        FRTermoDiario.QRPrimario.Print;

      QRTermo.Close;
    end;
end;

end.
