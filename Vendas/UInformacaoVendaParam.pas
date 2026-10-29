unit UInformacaoVendaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBPanel,
  DBCtrls, UFmMarca, UFmClasse, UFmDatas, UFmLote, Mask;

type
  TFInformacaoVendaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GBGenero: TGroupBox;
    cbMasculino: TCheckBox;
    cbFeminino: TCheckBox;
    cbUnissex: TCheckBox;
    cbAdulto: TCheckBox;
    cbInfantil: TCheckBox;
    cbBebe: TCheckBox;
    GBSalto: TGroupBox;
    cbAlto: TCheckBox;
    cbBaixo: TCheckBox;
    cbMedio: TCheckBox;
    cbRasteira: TCheckBox;
    cbGrosso: TCheckBox;
    cbFino: TCheckBox;
    cbAnabela: TCheckBox;
    cbFachete: TCheckBox;
    cbEncapado: TCheckBox;
    cbCortica: TCheckBox;
    cbAcrilico: TCheckBox;
    cbLatex: TCheckBox;
    cbBorracha: TCheckBox;
    cbPVC: TCheckBox;
    cbTR: TCheckBox;
    GBMaterial: TGroupBox;
    cbCouro: TCheckBox;
    cbSintetico: TCheckBox;
    cbSwed: TCheckBox;
    cbMicrofibra: TCheckBox;
    cbVerniz: TCheckBox;
    cbLona: TCheckBox;
    cbTecido: TCheckBox;
    cbGliter: TCheckBox;
    cbCamurca: TCheckBox;
    cbNobuk: TCheckBox;
    cbElastico: TCheckBox;
    cbPlastico: TCheckBox;
    GBConfig: TGroupBox;
    cbBoneca: TCheckBox;
    cbDorsai: TCheckBox;
    cbSlipper: TCheckBox;
    cbEsportiva: TCheckBox;
    cbIate: TCheckBox;
    cbSlipon: TCheckBox;
    cbIndoorSalao: TCheckBox;
    cbCampo: TCheckBox;
    cbSuicoSociety: TCheckBox;
    cbTiraTornozelo: TCheckBox;
    cbSalome: TCheckBox;
    cbDedo: TCheckBox;
    cbGaspea: TCheckBox;
    cbTiraX: TCheckBox;
    cb2Tiras: TCheckBox;
    cbMule: TCheckBox;
    cbCoturno: TCheckBox;
    cbMontaria: TCheckBox;
    cbOpenboot: TCheckBox;
    cbAnkleboot: TCheckBox;
    cbOver: TCheckBox;
    cbCanoMedio: TCheckBox;
    cbMangaLonga: TCheckBox;
    cbMangaCurta: TCheckBox;
    cbTermica: TCheckBox;
    cbProtecaoSolar: TCheckBox;
    cbLargo: TCheckBox;
    cbEstreito: TCheckBox;
    cbMedioConfig: TCheckBox;
    cb2Alcas: TCheckBox;
    cbTransversal: TCheckBox;
    cbBau: TCheckBox;
    cbNotebook: TCheckBox;
    cbFesta: TCheckBox;
    cbClutch: TCheckBox;
    cbEscolar: TCheckBox;
    cbViagem: TCheckBox;
    cb2Rodas: TCheckBox;
    cb4Rodas: TCheckBox;
    cb5Rodas: TCheckBox;
    cb360: TCheckBox;
    cbKit: TCheckBox;
    FmMarca1: TFmMarca;
    FmDatas1: TFmDatas;
    FmClasse1: TFmClasse;
    FmLote1: TFmLote;
    Label1: TLabel;
    MECor: TMaskEdit;
    METime: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEEsporte: TMaskEdit;
    RGSolado: TRadioGroup;
    RGBico: TRadioGroup;
    RGEnfeite: TRadioGroup;
    RadioGroup1: TRadioGroup;
    PRelatorio2: TPanel;
    MELoteIni: TMaskEdit;
    MELoteFin: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    MEReferencia: TMaskEdit;
    cbChunky: TCheckBox;
    cbSneaker: TCheckBox;
    cbOxford: TCheckBox;
    cbBrinde: TCheckBox;
    cbEspadrille: TCheckBox;
    cbContraforte: TCheckBox;
    cbLuz: TCheckBox;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaPanel(pPanel: TPanel; pEnable: bool = true);
  public
    { Public declarations }
  end;

var
  FInformacaoVendaParam: TFInformacaoVendaParam;

implementation

{$R *.dfm}

procedure TFInformacaoVendaParam.HabilitaPanel(pPanel: TPanel;
  pEnable: bool);
var i: integer;
begin
  for i := 0 to pPanel.ControlCount - 1 do
  begin
    if pPanel.Controls[i].ClassName = 'TComboBox' then
    begin
      if pEnable then
      begin
        TComboBox(pPanel.Controls[i]).Color := clWindow;
        TComboBox(pPanel.Controls[i]).Font.Color := clWindowText;
      end
      else
      begin
        TComboBox(pPanel.Controls[i]).Color := clBtnFace;
        TComboBox(pPanel.Controls[i]).Font.Color := clBtnShadow;
      end;
    end
    else
    begin
      if pPanel.Controls[i].ClassName = 'TMaskEdit' then
      begin
        if pEnable then
        begin
          TMaskEdit(pPanel.Controls[i]).Color := clWindow;
          TMaskEdit(pPanel.Controls[i]).Font.Color := clWindowText;
        end
        else
        begin
          TMaskEdit(pPanel.Controls[i]).Color := clBtnFace;
          TMaskEdit(pPanel.Controls[i]).Font.Color := clBtnShadow;
        end;
      end
      else
      begin
        if pPanel.Controls[i].ClassName = 'TLabel' then
        begin
          if pEnable then
            TLabel(pPanel.Controls[i]).Font.Color := clWindowText
          else
            TLabel(pPanel.Controls[i]).Font.Color := clBtnShadow;
        end;
      end;
    end;
  end;
  pPanel.Enabled := pEnable;
end;

procedure TFInformacaoVendaParam.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  HabilitaPanel(Self.PRelatorio2, (RadioGroup1.ItemIndex = 0));
end;

procedure TFInformacaoVendaParam.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitaPanel(Self.PRelatorio2, (RadioGroup1.ItemIndex = 0));
end;

end.
